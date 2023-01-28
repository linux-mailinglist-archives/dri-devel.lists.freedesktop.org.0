Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABDF67F9A1
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 17:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B499A10E1EA;
	Sat, 28 Jan 2023 16:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CD610E191
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 16:44:38 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 e8-20020a17090a9a8800b0022c387f0f93so6525903pjp.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lRK+a9egMMuJj/YCMLvcukUA2pHrW9lACkwnEGsjQY4=;
 b=YLrrqdUISs2hunWzunrU1MpYYFQg5exQUtgL3sO2kpCvi+48qq5qlvJPAPfoNsaX2V
 PQaBG3WeSjiGi4sQOgyGvgWIjVOcHLbEmCqIEeGNyacEdbDR77YRFApsQTghWafHlhUy
 PmELuCkics7xnM3gmp/rl5r1n3cVQEeRaGWwt1HBGXS0Vw0ZLGFWeYAnXDQFsLlk4bnk
 HeaT/CbKtTp0B5A0MFlRhP73u1+XmrwNWkgajzSCsE21yuPWKEgayflpb0Gb54Gvq8R6
 e9316wm0PV8Vgz/JcK9MnpREHwquoZmOzp5JGLa56FKmfiKlBGPgMa0Ho/pOhYzAoiry
 mVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lRK+a9egMMuJj/YCMLvcukUA2pHrW9lACkwnEGsjQY4=;
 b=7LkAIQbz55vwh6fOh2zi4ad4ojxa0zpTwZZaHbVa463c0qCQX39wM1Pw/5UFR7AZOU
 xwk6PBWQ/p3RWN+mQ90qJwkCnmWKD/3teZpm9yfCk5ZsLmLOVsLVnlR6bzqLt2dASwV7
 Im5D7r6ajcHelxeGHeqSV8hQScQcaP+45LOImnv0hsQo769vmF/vD3wTpxt44R0qG9EX
 /7UfWOzsqzxx242napZLUtD+wwRUMxZfCTGsBIMcHz9Kl2e/dNrrPCJEeRB6SAPslMVM
 5RyNXA3uuSuhBGUCM24IRtVH7vgTji7RUeCK/FFCrln4cRIWeoDGUxdJ4d8LrrThJN2E
 zY2Q==
X-Gm-Message-State: AO0yUKX227UGdCGmUyAR2WmTUh/eQRBv+J8gM0ZFIkqBqFXF1bPJcd8E
 ypPxEgu/2/RqkXuOEAWCqCg=
X-Google-Smtp-Source: AK7set8ZauZpaYA13Y/eLaymM/mLxLKM8DLhC6keL2/YDiewfzJ9wRRSDfFO07TsDPXR/CpR4Bj/kg==
X-Received: by 2002:a05:6a20:1442:b0:bc:4369:f72 with SMTP id
 a2-20020a056a20144200b000bc43690f72mr7905391pzi.9.1674924277682; 
 Sat, 28 Jan 2023 08:44:37 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a62b406000000b0056d7cc80ea4sm4505795pfn.110.2023.01.28.08.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 08:44:37 -0800 (PST)
Date: Sun, 29 Jan 2023 00:44:30 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Message-ID: <Y9VQ7oEBtR6bA8fP@Gentoo>
References: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
 <Y9RuDM9VAMBzj4vd@Gentoo>
 <20230128133239.ndanz4gzm73wwaiv@pengutronix.de>
 <Y9Utsbi5PYZ26m9j@Gentoo>
 <20230128161613.zx24zhdqj66vxhcz@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230128161613.zx24zhdqj66vxhcz@pengutronix.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 28, 2023 at 05:16:13PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Sat, Jan 28, 2023 at 10:14:09PM +0800, Jianhua Lu wrote:
> > On Sat, Jan 28, 2023 at 02:32:39PM +0100, Uwe Kleine-König wrote:
> > > On Sat, Jan 28, 2023 at 08:36:28AM +0800, Jianhua Lu wrote:
> > > > I prefer that you pack this commit to the i2c-tree commit that drops
> > > > old .probe(). 
> > > 
> > > That's fine for me. Can I interpret this as an Ack for this patch?
> > 
> > Yes, but can't get my A-b directly, this patch should be ignored and 
> > resend it within the i2c-tree patch series or split it to two patch
> > series.
> 
> I'm not sure if I understand you correctly. Up to know I though you want
> the patch as is go in together with the patch that modifies struct
> i2c_driver such that the PR has in two separate commits:
> 
> 	i2c: Modify .probe() to not take an id parameter
> 	backlight: ktz8866: Convert to i2c's .probe_new()
This is case 1, the case 2 should be:
	Patch 1: i2c: Modify .probe() to not take an id parameter
	Patch 2: backlight: ktz8866: Convert to i2c's .probe_new()
					 'subsystem': 'i2c driver name': Convert to i2c's .probe_new()
					 ...
> 
> Did I understand that right?
> 
> In that case an Ack by you would be fine and welcome.
> 
> I don't want to squash the changes to the ktz8866 driver into the patch
> that modifies struct i2c_driver, as this needlessly clutters the commit,
> if it's that what you wanted. (There are more than 1000 i2c drivers and
> the others are not converted in a single lockstep, too.)
Do't squash this patch, I'd like you send a series patch instead of
a single patch.
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


