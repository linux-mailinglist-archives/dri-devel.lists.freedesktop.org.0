Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E0AB8F0B5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 07:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6983310E069;
	Mon, 22 Sep 2025 05:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B7h+TFWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C017510E069
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 05:47:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so8805965e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 22:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758520067; x=1759124867; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PgF8X/QknqlL8yTU3Gny95ANJR22ql/Nmd198jD0198=;
 b=B7h+TFWDRA50bcIi4yXB84NI0jahw0ygn38ke6qlQn7Zy1EQ8p79cMhimdH6HBewpr
 VDCaNLqPxluLTBMhuwOAmfzJX0WfrCGrbACX4WHIj+IWHH/xNnQrYrKKt1GfyxIJmgsE
 0vp7qFP4BrWp/lnRp5fjzvy1qQ5GN21Sd6UxfAw7QW6B90mgYQOFjlUFF/ZH0Hyzq8Xe
 Oam+gEmrsQgRLot9MqiIvwZvMY+auiGwUiBwnSo2bSiXEhHJUn+HdsOVHBEsrtZGVM/M
 55+8S8LqYNajbxuYYT6qgTWwFsqbbS2045JsM4ITF9Gn2DPYRXP/+CP88w4p23e6HSMR
 h6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758520067; x=1759124867;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PgF8X/QknqlL8yTU3Gny95ANJR22ql/Nmd198jD0198=;
 b=Vj3U6smTSEcs8ssJfC8YYECS76VnCuazOI2Kx67E8YUNtCrG7OdbW7SvNLt9y59ZeX
 u2b4T+L8nCRypN17nF9+KA98b7tF/cEfaRtBM7FY1LgfkHEVUTvUO2kvW93qvxwIPO5m
 0Xul18kNiX6EeraaCDBQLjsRTG5CKHxCRX4UwGaAWyRuiEiSN/PW8VZfwX9BdMJ/Vhhd
 GApL4+oo93CNZzHc6T8KgoCUAGdNTwRBu98aCBmoyDUY8FOXEp2C6UV4834xjRbXIVfB
 OEQXOZcKSoy9wFDZbOvMJJbqeOUn/mpM69QBOEX0wksX90p9rH28CU4jv2ylEQrCXldA
 61nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb8lXLiO7GQ2hqUCWW12NtLWKBdq04swsaz8AdeOws5yC/U3WGM7BmiJ5GRuhzmYLh8ySoF6u0RO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsPwAktjr4Yd1Q4MABqgY/XKPOGUVre2ZK1y+dtMIfjZTRCGM9
 O19zXecG0yK7VuKvTQsXlxLtPclBUYms2RhvIjQXYskevQ5xrR85ZTHDar3zgC2OuqQ=
X-Gm-Gg: ASbGnct3zzUnrkoJq3egzUH2snRiiY5jkDINCqDvfqTXGppBIXKj6K9LqzocW0DGkTm
 0gK8obTinocU3oN9JwawvOnwwvLs4F7lUOi6tWnq10A5siu2j3+rxkwt+/NypH958QtLrkNlY9d
 vCKpwHkhmtul3DhTZWFjL1kXSEQbDhL/A6U4H1J6YdJlR+3TkstZ/a54YVFRDZXA1Cq9mPItPAv
 Bxm8ggmycuBtBdKBnL1vnE4DtMQLxtqOffbobG6D9g1pya+AiG5R/IWpUWK5zps2FBJjCaWcaj/
 LE2HATjtm/uk8VQHQ0IsU7Fbw3DNJPkUI9DvLHchx1TYzhvDNrRh/uHigW383PkLjrYyitY1zeJ
 dduFWzUCyxYs0rRfHekgTMlTqiRNPZDwVPPh29S8=
X-Google-Smtp-Source: AGHT+IGLJaZqA8B6N5lCxrnKQqccvunxcRo/0Al2H98KlFFEySPCueUYtQV4CEaHF676873fabSWPQ==
X-Received: by 2002:a05:600c:1f85:b0:45b:79fd:cb3d with SMTP id
 5b1f17b1804b1-467ec45ff4amr92308585e9.36.1758520067060; 
 Sun, 21 Sep 2025 22:47:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46d1f3e1b03sm32067045e9.23.2025.09.21.22.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 22:47:46 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:47:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
Message-ID: <202509212215.c8v3RKmL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250914155308.2144-1-rubenru09@aol.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ruben,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruben-Wauters/drm-gud-replace-WARN_ON-WARN_ON_ONCE-with-drm-versions/20250914-235627
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250914155308.2144-1-rubenru09%40aol.com
patch subject: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
config: x86_64-randconfig-161-20250921 (https://download.01.org/0day-ci/archive/20250921/202509212215.c8v3RKmL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509212215.c8v3RKmL-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/gud/gud_connector.c:597 gud_connector_fill_properties() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +597 drivers/gpu/drm/gud/gud_connector.c

40e1a70b4aedf2 Noralf Trønnes 2021-03-13  580  int gud_connector_fill_properties(struct drm_connector_state *connector_state,
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  581  				  struct gud_property_req *properties)
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  582  {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  583  	struct gud_connector *gconn = to_gud_connector(connector_state->connector);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  584  	unsigned int i;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  585  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  586  	for (i = 0; i < gconn->num_properties; i++) {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  587  		u16 prop = gconn->properties[i];
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  588  		u64 val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  589  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  590  		if (prop == GUD_PROPERTY_BACKLIGHT_BRIGHTNESS) {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  591  			val = connector_state->tv.brightness;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  592  		} else {
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  593  			unsigned int *state_val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  594  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  595  			state_val = gud_connector_tv_state_val(prop, &connector_state->tv);
d00e57106c0d0c Ruben Wauters  2025-09-14  596  			if (drm_WARN_ON_ONCE(connector_state->connector->dev, state_val))

You accidentally deleted the IS_ERR() check so now this function is
badly broken.

	if (drm_WARN_ON_ONCE(connector_state->connector->dev, IS_ERR(state_val)))

40e1a70b4aedf2 Noralf Trønnes 2021-03-13 @597  				return PTR_ERR(state_val);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  598  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  599  			val = *state_val;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  600  		}
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  601  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  602  		properties[i].prop = cpu_to_le16(prop);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  603  		properties[i].val = cpu_to_le64(val);
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  604  	}
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  605  
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  606  	return gconn->num_properties;
40e1a70b4aedf2 Noralf Trønnes 2021-03-13  607  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

