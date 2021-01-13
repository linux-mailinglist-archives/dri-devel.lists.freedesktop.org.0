Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 474862F53DE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 21:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816646E8B5;
	Wed, 13 Jan 2021 20:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13896E8B5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:09:47 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id g15so2178565pgu.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=quEGMWpqr7/pNxdPiyN4UcKEYv34p2VMMn6TPSnLeRE=;
 b=huCcpMVXEfvnePLTSbMMyOnX4xJY9798nkfPZB4CTpCDdZG25t7v5T649T6VFkyr8q
 o5gm2R2OeStmg1cqAbWN1zg1yLsNKPi2jFiFJEjAeWqxXMvmGM6cXKbyrqy6NXXVspcp
 7qrBcZtlwZ704Z4IOyArXiJtLxjWLydZhS30MTbSbmIbeIZ9g5pos5ISnOkQUBBRO+NF
 9W1c9ckgWFTKVRndFv8KBej7e4nzS1Gt+1edTyJ543Am9JrCpni3bwsdn6j5hZpCgePK
 KTzpswu9AI4mPZtPp+JtBn3L5+pu0F85uJQqearmeQDMmmFWgSZUsuVTBW5ClMfOaqBr
 L/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=quEGMWpqr7/pNxdPiyN4UcKEYv34p2VMMn6TPSnLeRE=;
 b=piUy3G70tw/UVJFszAYhLXahBO/vSoRjnoHIPrCpUP8WAilMI2nTtPGuin5JXGJJMR
 k89EeVyOsFsfsGr3nHsR/RtiMfFtNauVkBO0FxJDxZrqbLWjLZlhEsOAaPbBxP3a9bcI
 O1Ek3bQ/7SbGD1a2F/OqgcEBQEXcftgqkSj0hbzsXaN1PaR02DmGNz2cltiRhTEw05f4
 4foJFUOilODRSzodFYyZOd1AEOAzJwOlfldlRpYwdXEdKuT17PdxGddY63b85nzIzHbE
 UKugVywnP9QwfLRIrE1NNvVD3XXin+xePVKqs2crpETektwmGQmAC+JFS5wZuL3hHD83
 7JwQ==
X-Gm-Message-State: AOAM530kLMXNuYXkIF2n6/U6eQdqBNIdR15jCbqbc/9SiZylM12bgwjA
 L3MWmtvFTfomGDS9t1hdKDQ=
X-Google-Smtp-Source: ABdhPJwaRhjR6HWEFrwrnlZ65nwyNXiah21tWRAzbtXIE5YdP4RTqA8f2J1+UuDCwV/bBuRpKc6RfA==
X-Received: by 2002:a63:5a08:: with SMTP id o8mr3696381pgb.118.1610568587568; 
 Wed, 13 Jan 2021 12:09:47 -0800 (PST)
Received: from SLXP216MB0477.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:9::5])
 by smtp.gmail.com with ESMTPSA id 8sm3174055pfz.93.2021.01.13.12.09.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Jan 2021 12:09:46 -0800 (PST)
From: Jingoo Han <jingoohan1@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 30/31] video: fbdev: s3c-fb: Remove unused variable 'var'
 from 's3c_fb_probe_win()'
Thread-Topic: [PATCH 30/31] video: fbdev: s3c-fb: Remove unused variable 'var'
 from 's3c_fb_probe_win()'
Thread-Index: AQHW6buC2l9DKORK3kqz2CrpGhFdF6ol/JYr
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 13 Jan 2021 20:09:42 +0000
Message-ID: <SLXP216MB047735F322B9D2040903217FAAA90@SLXP216MB0477.KORP216.PROD.OUTLOOK.COM>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
 <20210113145009.1272040-31-lee.jones@linaro.org>
In-Reply-To: <20210113145009.1272040-31-lee.jones@linaro.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
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
Cc: Ben Dooks <ben@simtec.co.uk>, Han Jingoo <jingoohan1@gmail.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/21, 9:50 AM, Lee Jones wrote:
> =

> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/video/fbdev/s3c-fb.c: In function =91s3c_fb_probe_win=92:
>  drivers/video/fbdev/s3c-fb.c:1176:28: warning: variable =91var=92 set bu=
t not used [-Wunused-but-set-variable]
>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Cc: Ben Dooks <ben@simtec.co.uk>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/video/fbdev/s3c-fb.c | 2 --
>  1 file changed, 2 deletions(-)

[...]

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
