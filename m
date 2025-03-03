Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA01A4E701
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D0610E64E;
	Tue,  4 Mar 2025 16:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KFB/Uj9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17610E389
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:54:57 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id A458C408B65D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:54:55 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KFB/Uj9f
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dbW0lNMzFwvx
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:38:47 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 642DD42754; Tue,  4 Mar 2025 17:38:28 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=linaro.org header.i=@linaro.org header.b=KFB/Uj9f
X-Envelope-From: <linux-kernel+bounces-541341-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=linaro.org header.i=@linaro.org header.b=KFB/Uj9f
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id 2513F4340B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:08:55 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw2.itu.edu.tr (Postfix) with SMTP id AFAA22DCE5
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:08:54 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64ED3A30DA
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0A31F2B83;
 Mon,  3 Mar 2025 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KFB/Uj9f"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172D61E9907
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.208.50
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740996517; cv=none;
 b=hRMEqsxlyeyGn4b7RcZ0tGA4k8TUVVdcZ2WMalKj/a64t8uo2eJJg0fRFBuUCZcvZWf1q49n1oDsb8aZbEylqmKzkECmZ+ML4znzUDydmM3LXdYnXwlbb/e6aTDoRSYE7YVNB+2mPtv1hekgbSEi4B1Xxa41cDPPQf2X/I5dRLc=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740996517; c=relaxed/simple;
 bh=Fg0PMUf71HrKqLcTdAMEOyWnPDpROLGy0gLEnbMjfIU=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To;
 b=jE68A+dSrZFvdNon7RALCblYlPsmyzPt9UPWHo4XfwY+Zh1Z6bJYse0ZAUebvuaZBdPOZae0MmkLVomkcy3/LJ2hwC4ffoEXyKiQpOvKWplKqPEaIzFKxyN5oj1H11w/3LLtmOwrOT7m0TdwyQk/WSnWroWTDFlx56K4S/EjpE4=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b=KFB/Uj9f; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e4ad1d67bdso6653693a12.2
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740996514; x=1741601314; darn=vger.kernel.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GjBFcA67rMS7ZHAwLBuRWTDfKIm2qOaBa66RMYQiiBE=;
 b=KFB/Uj9fe1HQqhfh294N7SmosO9Bl0Uyrom98f3vxF/vx2yjJcd49hG6tdxfHMWVU5
 avqx5k1KEL+cioBmDPZDYBcY3fHa4pqfLHTqesF5N+tRzDEN5JX+DTE19/F0dIaWX1Bg
 1apLKX1lxhh4vsZJ0nPSIE7BeSuddlTJevQ76g6uIZJSyTMov+O6lVpC5TOQ75pNhhaa
 Q5BrDlFuC64Tq1NRm66fkV5+HdF26K0hz8dvDIT/caMUDpQy0afbpNHjndM8L3T7ttob
 BP1kSbL4dqIG2CddQ94zMRKZ4LMkHJEZhsTWBAkJtm4atZJbn2yU9iM3UwEiDXaGiUn9
 MwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740996514; x=1741601314;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GjBFcA67rMS7ZHAwLBuRWTDfKIm2qOaBa66RMYQiiBE=;
 b=D1ADz/XifIHYXS+QLQvWOjrB2tPSHf2/svdZsjpHecdn2vCJcC1Yy8vB/OtH9qXEj2
 WvIFUXAHN8E8Io0IY5l06qfTDKXoqujulDKV5greRlMC+jy2NpuGrTVyJ5PdVQDvqJkY
 3kJEXXNqDB9yOEXVhkh+oXiSqydm7sm/uIF1/Okpe5SH9gwe8WRWYSW5wP36TCdqhA3H
 QNQ9Z9nPvLBPQrUOFTrUYxhiYlucaO9pBzX2r8rIz4TCkD7KKq2iJ+l87l4GCnvjzIPA
 uZoB91rAq3tUNVnsPsLMR5AT8p21cNxVKIj0Vf0C6989AGtidGtSlTVbmJFq/Kz/0gbx
 GQJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVXboMVG7Slv71+FvTvkwwvV+/twRTn4oYhErqDvCS/16c+h/gKZzmayM0esDRuOKK+3M7pQK7U2QzwGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGtd9i4FdWL6h4z4cp++FKvV1UbEekOdhxpIcIXPfbOGOBvPAA
 m9Mp0Mlu1/nhE4K7ooKfrY4or0el5YrkVpFKnrtiuGFX1wKX0zAB5fQ5tCqX9h0=
X-Gm-Gg: ASbGncvAdOccs27mx67eZ7DO3UVvSmIJDw5b67YLwpRgbNfUWd2qlw6kCZe1yNz6xlE
 MSvW/VgsRmyLC96mZvcl6QKo3dAp5sYaSWm47qdBXNb6+HjKVZwgr1wuA7JFJrFWyp+lQ4D04xN
 e9D+6pqubexWIqYAwbzNIzYtNhDArmTdoeHYnTUCliO6Fd1stUio90lBqViqCxWVn0xrSnbvp1s
 Uu9Up4y70I6+YdxOaWXigcUR8+IufmgciiGoeq2Hiu/BkbH5150CZtmrx6rlMzWGtzg5nROexFp
 bQU+PGhcZijs1ZrVl2QIDtSQ+XWnisGwkX9BmugOcjJySxKmCg==
X-Google-Smtp-Source: AGHT+IEPxlHoiKz/rey+mSNj9p6SHZuD3oFGIyaUPKEFRRWxafVAlE/vcmhJEnz4DfJOlevycDZ6wA==
X-Received: by 2002:a05:6402:274a:b0:5e4:c235:de10 with SMTP id
 4fb4d7f45d1cf-5e4d6b7b21fmr11376850a12.32.1740996514382; 
 Mon, 03 Mar 2025 02:08:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e4c3b6cfd0sm6648394a12.28.2025.03.03.02.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 02:08:34 -0800 (PST)
Date: Mon, 3 Mar 2025 13:08:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Antonino Daplas <adaplas@pol.net>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yihao Han <hanyihao@vivo.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
Message-ID: <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6dbW0lNMzFwvx
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741712007.79243@UEqchnCFcX4odtiIomI4GA
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On Mon, Mar 03, 2025 at 10:19:06AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Sun, Mar 02, 2025 at 07:02:12PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 13 Apr 2023 21:35:36 +0200
> >=20
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the function =E2=80=9Cau1100fb_setmode=E2=80=9D.
> >=20
> > Thus avoid the risk for undefined behaviour by moving the assignment
> > for the variable =E2=80=9Cinfo=E2=80=9D behind the null pointer check=
