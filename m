Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B08995E5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 08:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C93010E7C0;
	Fri,  5 Apr 2024 06:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wsGZ0147";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C90A10E7C0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 06:52:39 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a51a7dc45easo21157066b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 23:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712299958; x=1712904758; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OAoWz44Vah0FBQQ++BlkUgil4y/bpkTelSJbB2HtwhU=;
 b=wsGZ0147H7T9ywsP7mZaR1cyBaFXxkd/COpikkbSJ1mlnW6sLRsmVgYIbTjfiIce4/
 QFqcTL3dX2YbsBJgLUxmx2gr3oAWYMBr7tVrfyLPnWb8CGoL/qTg/1yuuBEkR+zaMDF8
 bV5P87SxYrBXf7IZLx2kBg3sfpWD9EBubQPGvyra3K4G0rlurzGvvgm81j1kBecrvIjM
 uX+FR209Z93JVmEu1rZNaiYUzVyljno7B4kCiY6SoBzHlRk4fkR6hAjMJhsc5i0NwiwU
 TepR3iO4grhoNQG0hyb7JNs3wZb8iE1Vm7tnlQoUplEQCI6HmAnqyGVzBVYi1fWPKFq6
 v/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712299958; x=1712904758;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OAoWz44Vah0FBQQ++BlkUgil4y/bpkTelSJbB2HtwhU=;
 b=BwvBk7qXbZY2mkThz2dueFYHvKqg17syeeD8Eu4F412YiRECFz3QzsGjWoJNhz0rfM
 zgZzXVDg1sgTEGAoYcjzbzLOdMP7wUHMnUgIWSWvTA/2XOH3upZUwjtuABkdv36djSvc
 2x76agZokPlagLOpu0lLdC29QLpUJWcbmnTGmuBXiGf8HLTtzG4iwHBcw5ul+/jmZM1V
 /jk29v7MdmpEX7ZrMiK4Oh8CG2bS9Tv3/SuegYbidb3cng3pB1n6AULS7NHTdKK7S72A
 JuE3huIiLHloQncwYUoVXlZ9mePzdZS13F0xvKkOsq5dQRdfz/I3gTyRRkuH8DKgMnnr
 IwtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWvCzXSJYNpEHtI7KZTP/FX98AtCeIg9mgFx2sp19Ylxi5ZHB8w9wYUUY75xq+aFnJxOz90HRYpo0DlaIXiVv8r/sRtnAv/oTNHc2gdjRK
X-Gm-Message-State: AOJu0YyqN58Jn/Ef+r005WC6Po6+DjQeiBKq5KYFJ4bq3YwokyUCgkUh
 GbChRESDpbQd8UIm4xYO7QZYvlzvzFzBlXVqNxwpi2xsU05XsMUh06piI+J+ptc=
X-Google-Smtp-Source: AGHT+IHrwnngq+1Rt4kkQZqXldfwAXh/zqUOJ3sPDzmdU91aZ2DmDYA4tJB6sJ+Sb8yrjn9BGztDCg==
X-Received: by 2002:a17:906:a895:b0:a4e:2a5b:f94 with SMTP id
 ha21-20020a170906a89500b00a4e2a5b0f94mr412192ejb.6.1712299957495; 
 Thu, 04 Apr 2024 23:52:37 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 se1-20020a170906ce4100b00a51a9d87570sm147217ejb.17.2024.04.04.23.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 23:52:37 -0700 (PDT)
Date: Fri, 5 Apr 2024 09:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/7] drm/udl: Remove struct udl_connector
Message-ID: <39bfffb4-1e72-4b37-bfa7-1c52d969ddd3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404150857.5520-8-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-edid-Implement-drm_probe_ddc-with-drm_edid_probe_custom/20240404-231057
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240404150857.5520-8-tzimmermann%40suse.de
patch subject: [PATCH 7/7] drm/udl: Remove struct udl_connector
config: parisc-randconfig-r071-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051359.Y6AgUwFi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404051359.Y6AgUwFi-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/udl/udl_modeset.c:527 udl_modeset_init() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +527 drivers/gpu/drm/udl/udl_modeset.c

72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  518  	encoder = &udl->encoder;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  519  	ret = drm_encoder_init(dev, encoder, &udl_encoder_funcs, DRM_MODE_ENCODER_DAC, NULL);
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  520  	if (ret)
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  521  		return ret;
72d73dd3a95c7e8 Thomas Zimmermann 2022-10-06  522  	encoder->possible_crtcs = drm_crtc_mask(crtc);
5320918b9a87865 Dave Airlie       2010-12-15  523  
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  524  	connector = &udl->connector;
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  525  	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
a80d9e00c8195dc Thomas Zimmermann 2024-04-04  526  	if (ret)
                                                        ^^^^^^^^

fe5b7c86d6068ac Daniel Vetter     2020-03-23 @527  		return PTR_ERR(connector);
                                                                       ^^^^^^^^^^^^^^^^^^^

This needs to be updated to "return ret;"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

