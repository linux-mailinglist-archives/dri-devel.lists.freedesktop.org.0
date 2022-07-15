Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1718B575875
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 02:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D6810EEF8;
	Fri, 15 Jul 2022 00:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0834F10EEF8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 00:05:00 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id e16so3243035pfm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=aLkKRaOcJkecC7a7hCUl2f3zvdxWOhT4lQJMyspC0FM=;
 b=IqeRqPZ3qF8cGKCO52T4NT7b0KClEh8Mtu298guXjrnlWQAtq0lDeurmiocTHaLH77
 FFwBhHmHZpa8IhF6c5ZBXzSpG+IQpozgVAyYpbYVpHUhPW6pcfLRkxkNdjA3WP8q6si8
 jU91uyXqS6KOTRFDGmFoaU91W+yPsnbsRnCXNFMCAZTxTHoPHyjMm5cfo3S873x/p90k
 FYgD90AeidbGiba/MSFxzd/hKmJpROhaF/CvP5C/jUv8/40lVT2wIxFa/ixlFBpJb1h3
 662CpB1q40lEoqvNRNcZ9W7TYJAbIWVXaBzs4oh4z65c4wUATKcvCoNiNhqMzHOXeOUy
 W1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=aLkKRaOcJkecC7a7hCUl2f3zvdxWOhT4lQJMyspC0FM=;
 b=0Vl36AH49lVFVqGzgrcL8saSPgoToWyfT16rBH6Z7kN42APIooA2gAhcLjjc0jh8Fi
 PIiQcK2jh6oO/zWXlsAu3w748CgQvpQTFL7d15QbGhTtvDo4Oc7SKj3EVuCawTfvoFDj
 8HgRgY4G9cVgQ8Jc49r68OQXHUrAteKvp5svs1NqxhE8VVqs2CIWLu32IwilgOu79Whd
 jqg5bSBVmZ6vGFOMuqmEHANm32+GuSgemKs9u8MEmg7vwHQH9+WlbvvvlVDV+Xgd0Ty8
 1X/U6fElBW+vCFAdop5x9u65oatnJy2J6HrENmYqEQ58ruJ53mtAf3AkNf/o9j8Rj4FR
 Ns+A==
X-Gm-Message-State: AJIora9ErB4rR1kwodrd3YsxlLloZzUMGqLOZ8CFYCi99NCoLhR7FVtK
 TZZUepwO2rRTA+dL34IAkHI=
X-Google-Smtp-Source: AGRyM1txesrCDgR42eBBij0RG2Z8x5Rlh9hy1SdbxF1Y4yW+++AjNOqM6ckBYKqRJg5/k6yZszigMQ==
X-Received: by 2002:a05:6a00:198f:b0:52a:dc25:cc78 with SMTP id
 d15-20020a056a00198f00b0052adc25cc78mr10815233pfl.20.1657843499626; 
 Thu, 14 Jul 2022 17:04:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g30-20020aa79dde000000b005251b9102dbsm2355500pfq.144.2022.07.14.17.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 17:04:59 -0700 (PDT)
Date: Thu, 14 Jul 2022 17:04:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
Subject: Re: [PATCH v5 4/9] drm: selftest: convert drm_format selftest to KUnit
Message-ID: <20220715000458.GA537048@roeck-us.net>
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-5-maira.canal@usp.br>
 <20220714235137.GA485839@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220714235137.GA485839@roeck-us.net>
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
Cc: siqueirajordao@riseup.net, David Airlie <airlied@linux.ie>,
 Daniel Latypov <dlatypov@google.com>, brendanhiggins@google.com,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 n@nfraprado.net, Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 michal.winiarski@intel.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 04:51:40PM -0700, Guenter Roeck wrote:
> On Fri, Jul 08, 2022 at 05:30:47PM -0300, Maíra Canal wrote:
> > Considering the current adoption of the KUnit framework, convert the
> > DRM format selftest to the KUnit API.
> > 
> > Tested-by: David Gow <davidgow@google.com>
> > Acked-by: Daniel Latypov <dlatypov@google.com>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Signed-off-by: Maíra Canal <maira.canal@usp.br>
> 
> This patch results in:
> 
> Building powerpc:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_format_min_pitch':
> drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of 3712 bytes is larger than 2048 bytes
> 

Also seen with i386:allyesconfig:

drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_format_min_pitch':
drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of 2572 bytes is larger than 2048 bytes

Guenter
