Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A4A2A2E6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 09:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942FD10E7F0;
	Thu,  6 Feb 2025 08:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JNNHRTyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6DE10E444
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 06:47:25 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38db0146119so266195f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 22:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738824444; x=1739429244; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xbyOt/gDBAe0Hp7lB9Ind9nefS/u80v0z4K5ozL2/n0=;
 b=JNNHRTyQ6GjA/iPQBueD41/bfvxnpd852/DZb6K27LbGSUCRXpxTE/o3Gzl5Y00L3+
 ZUW7ZYxR/F1oKvwYmqNkFkw96Q3IQoRQ4FVFmOHzyuLvd5+ciTK7mi4oXL1w9yDm54c6
 FUFzU7EjNEb2w2uVbkI7bE6HPV/aLpUfROj4svKRc16lwrfdre2fuWcWwkSTESLD5f47
 5HpCKun4LhOT1yk1Pvt2yrtMk0cC/7sJjMNEKWwGEKUBTLgpJJ5b/GA9XiQghd0dvFyG
 t7XHUBtAmmkJWgwK34qgAATqJH/msrn+E1Sbw8/7UKzecaMypnmoWLbL2dLrYkE7yeX5
 wYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738824444; x=1739429244;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xbyOt/gDBAe0Hp7lB9Ind9nefS/u80v0z4K5ozL2/n0=;
 b=gsO+lLJpAJH94VXAFmpaIf/1CgWUdQiPUQOH6p+O/65yuxZFkjIc+imePXhKQgodUS
 Obfp+zx5qPjdtfEuMcx9SNEi4Xx41XrC/uQ4O2cuklhirz6W8dji3UsMH1EqHcFPSkqZ
 gOfJwt+xHRCcjwpfSWpj423j8/jJCgAwZn543jX2PfPFT3pKY0NSwQZbC+T3FmWTcoUC
 PTpzYfqHRsOBy/dKOz87lkIyxkjwWkJc8uznLUNcWgs99CrGoTnigUVqE7t0zClS66KH
 7yLAt24y+ewgiIuB63k02b+ySg/t8TUrcQpAcWq5wxCHl+to3GmxNW9CbCBtHIYwyEwX
 l9zQ==
X-Gm-Message-State: AOJu0YxdeeUiIFd/lTT8AoFXiGmIsZU8Yx0CxTGfEGs6GuLcD0PmaJxG
 vtf7wfh0jwGm/sCkjxde2ce/aDum65R49PPDpnHLlrOh7EdUmb1+MOnIxkXzU2ZwcLHugt/eBwR
 bl20ISN5DkeRxWl/8T0qUkKXR+lm+SEnU
X-Gm-Gg: ASbGncukOTFd9x+UH9fAP5LlQmE0pNF3ROaT4lHJrwkVuWv3xUwnbk6TOkd/89o1AIs
 E1gKG9OAxVp46obU+5ZJIOGCipenYtUJD21Q3nG7zj29AyBHZCoMYma47SUAslOmLu9kd1eNB
X-Google-Smtp-Source: AGHT+IGzbggOKS9PXdhciLpbeexA38zDwYXnfJpu1dQ+3QHH3T9Wfd4XfeXIiCRt/YALhMjVi+KDARIGt7/fSHyvn3A=
X-Received: by 2002:a5d:64ee:0:b0:38b:ee9f:52d5 with SMTP id
 ffacd0b85a97d-38dbb280acemr1352621f8f.16.1738824443826; Wed, 05 Feb 2025
 22:47:23 -0800 (PST)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 6 Feb 2025 07:47:12 +0100
X-Gm-Features: AWEUYZkpt7yzLxhkgltaE2TGmhm3dmcnZCqxNfZ87kSFHF7xdMBYOnHSo8TWih4
Message-ID: <CAAfyv375zYE2Y63vCYbrVbJ00910-fYN-L9EBCoCWpm=CPTXRA@mail.gmail.com>
Subject: imx8mm displaying hdmi in 1024x768 VESA mode
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000004d1cec062d739d6d"
X-Mailman-Approved-At: Thu, 06 Feb 2025 08:05:28 +0000
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

--0000000000004d1cec062d739d6d
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using the 6.1 kernel for the imx8mm board in combination with the
lt8912 driver to have hdmi output available. When plugged full-hd monitor
image is displayed but when plugged an older monitor with max
resolution 1024x768 there is no image displayed on it. I have no clue
where to start looking but would like to ask if such a combination is
supported. According to the bridge vendor such resolution should be
supported so maybe I need to tune something on drm?

Thanks and BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

--0000000000004d1cec062d739d6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;m using the 6.1 ke=
rnel for the imx8mm board in combination with the lt8912 driver to have hdm=
i output available. When plugged full-hd monitor image is displayed but whe=
n plugged an older monitor with max resolution=C2=A01024x768 there is no im=
age displayed on it. I have no clue where=C2=A0to start looking but would l=
ike to ask if such a combination is supported. According to the bridge vend=
or such resolution should be supported so maybe I need to tune something on=
 drm?</div><div><br></div><div>Thanks and BR,</div><div><br></div><div>mare=
k</div><div><br></div><span class=3D"gmail_signature_prefix">-- </span><br>=
<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e">as simple and primitive as possible<br>---------------------------------=
----------------<br>Marek Belisko - OPEN-NANDRA<br>Freelance Developer<br><=
br>Ruska Nova Ves 219 | Presov, 08005 Slovak Republic<br>Tel: +421 915 052 =
184<br>skype: marekwhite<br>twitter: #opennandra<br>web: <a href=3D"http://=
open-nandra.com" target=3D"_blank">http://open-nandra.com</a></div></div>

--0000000000004d1cec062d739d6d--
