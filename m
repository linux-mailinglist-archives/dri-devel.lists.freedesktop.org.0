Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D931577769
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 19:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AE912BA7A;
	Sun, 17 Jul 2022 17:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6EA12B4E2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 17:01:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d16so13890850wrv.10
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JvphByM1MAOXz82yC0EIJ626FOimB1Or0Bxt+vFezqM=;
 b=m5gwVxLrqgtTyZGq0uOPVFKCxV+A8iJB7uHVBYwSh7LwxhNXaV0UwRO3+pxiPB42WT
 WHd7nQuttN2COBFIcibf2ylp6AqjbZXk1U37vKYVWFPOTVE2qQSCnlRgqjZexfBrdAK/
 AivydN/zND2hHwxExjG44HsaQruFPVNp/npy5Ajcia9rS+T2pejihyxiuPAyjh3ERqF/
 Eg84sugu0/6bKyN9ch6g/Oo5YqvHHaE42KYO1DHGw4Gqd0vs4lRF75+LKIvwIOxXY7XD
 C2AohsAbspO/PkHwyNWvVS8B/Rmse9qtp3l4ZxP5+CZSyd9y04iyBsRdsj6tXstDDKzm
 /92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JvphByM1MAOXz82yC0EIJ626FOimB1Or0Bxt+vFezqM=;
 b=cKZPIsQLUE74up94HKgkkVP6XF1evgwRUKIwcEtG6lydJlmnElIrAh4nVfiiloMHkv
 DctJwNCyXC2UKYKtXqB5yXkSXpWlb4FmHAr0Ec823fY8MAmjd8OnSFLnwlDayMU6URBD
 kMKV3flY0j1coRX0Ul3MXMQRMhQVY/K0Naj6TPLa1dFWrrczoq8yyrH61g0GzdOLKuu2
 rzDN8UBn7wnPVWwn/YBB66sShzJAxdqD3Kls08OG0o//kiyOTFnLvxvZzWSoSd/Ag16d
 z2pIipbAdE6Sz2LRgRz87KWN80PTIBrPHSmwPJrn6cxvIOUQxNy10DTQ+m6/8hpj33Qg
 9PUw==
X-Gm-Message-State: AJIora9sPvkt+l3WgQ4PI8Sr6pThkhUL4Y9ovcrY+sfCd7gZ/Vpcoe3+
 fHvRkDGBYKdeNwCoqypgji8=
X-Google-Smtp-Source: AGRyM1sMJ8cShWVKVwOYfqlYaaIQlHVPbcZr10SqOdTxkgHj2aL4Sk/XNhjomZLJNWKtQsqk8e4y4Q==
X-Received: by 2002:a05:6000:986:b0:21d:a497:c35f with SMTP id
 by6-20020a056000098600b0021da497c35fmr19960283wrb.24.1658077259497; 
 Sun, 17 Jul 2022 10:00:59 -0700 (PDT)
Received: from elementary ([94.73.36.185]) by smtp.gmail.com with ESMTPSA id
 r129-20020a1c2b87000000b003a2eacc8179sm12509264wmr.27.2022.07.17.10.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 10:00:59 -0700 (PDT)
Date: Sun, 17 Jul 2022 19:00:54 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH v2 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
Message-ID: <20220717170054.GA1028249@elementary>
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
 <20220709115837.560877-5-jose.exposito89@gmail.com>
 <CABVgOSmhOBdXPH_=B_WRcUjMGC-wVPTLBwCdbgZLb0o3-O8pKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABVgOSmhOBdXPH_=B_WRcUjMGC-wVPTLBwCdbgZLb0o3-O8pKw@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

José Expósito <jose.exposito89@gmail.com> wrote:
> I already fixed the warning and added the reviewed by tags, however, I
> noticed that rebasing the series on the latest drm-misc-next show this
> error:
> [...]

Sorry for the extra email. I forgot to mention that the error is only
present in UML. Running in other architectures works as expected.
Tested on x86_64 and PowerPC.

Jose
