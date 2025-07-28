Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B487EB132B2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 02:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9316010E22E;
	Mon, 28 Jul 2025 00:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="fPdYcKpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6A110E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 00:48:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-235e1d710d8so51268775ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 17:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753663695; x=1754268495;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/m2yLXtAPbsmvVSwdPJxGHPEjPAoGD9mowpJ03FJoE=;
 b=fPdYcKpjpTYJQW4PhaAKLwe+XhjT5jnVouBfCSoApJ7qtlVowjhXQIq1mlKmdDy+cv
 ck+vEGIXU9XQRGqwmfVNAvG4HrumdVaRv6o8xyd0dZ+E3KNzE97LAvDxlcYNpxVBG3PP
 f1eR8YD8Uj/QvkUOFjLyHpn3e+XONlOwaKKPWgag/Xvzm5DYPKVmKKdXFn1jPItEt0HS
 nJ+dd37ZC7D7fK+6lMUevjsh/esAGX9ajQYYTmndyKECfy7PA073cgfwUnphe/3hTIU2
 5dhBvZoWYVHrh8rTr9jhzXXJe1fXE6TmpghDh3iDQ1XSHs6JSUxS9m/zfsfrF4HHtjXT
 Oxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753663695; x=1754268495;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q/m2yLXtAPbsmvVSwdPJxGHPEjPAoGD9mowpJ03FJoE=;
 b=FlZC7W6+DBmq3R+Xv6w1dPH3bf2l8vGaZkeCVt/ebh8NNjz87JqM10mzn2gWAMXCjr
 B/dNURzGtx6Hw13ObLtKWmq1B/st3g4r6QacmTRyhvLNoS4sPB6SMBLLohEyB9qXLbuD
 W688Yhqe9X1MG+Q3N/njAktCsv7ZcyJhUKZHBzy2IGV8xERnPiem13T4FBOBOrEHmlvm
 QX4bwrnlwlubNFtM/gX9lY1tAl+nC7hU3+kRSTFTQ9Xusdmgujjq2GmKHBrZM2pWon8S
 4D57ZDhoDlT0KND0p7fo+S3gDvfJnksoArLs2OGSx6WOHB566h6fpiCna4LSZ4+kV/fD
 kdRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmSIKhXrUsuthIBiDSfr97t02+sLjNhz8+pD6pB26wO8lpBDRW47tyqSzR92+touma/+gFHr09WIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKJdBZL6pf3gT+q9BVGyQ9AdT4cMRary6Vcw4xZXPkpaX5R1Gw
 KY/IEYsswkq1n08bLmnsZDNURCM1NwA7dSEMQLLMr+83w+B0GkDXWbMDvK2KGYNhclc=
X-Gm-Gg: ASbGncsBkoTayq+3VorOAPRewmU1VbxIG5HtH4uAsr6IMTOMiESZzDaeI13EsyzwJ5S
 B/cDWwZ2KiaTBwoD3QLBm5btQz9VUDDInLMTJKXxWGeLrDSXItPqbtAIOz7kbGBPPhRwHxhGdMf
 zwFklZmLdCTdSVHMLALQl2r1F4pRrxybmTDV2A9CZbP8Pdst+lxL0QJusTQATtVSDRRoTFe6fws
 hXv14O9GfFDhiqQ/4IRFCfg17cQKu/NLraFGg9UOZDY/jwOmtgP/MDrpzKOb3vBKzWApCvIfeSI
 jbiaRavQZiFWAAcYHOzcFDcigO/M83pV7colDCUF4FyCxnBIWjx34v6GeV01sm3Cy7x8kyBfHot
 rY/mqPk06jzgDjuTceNs=
X-Google-Smtp-Source: AGHT+IGpUSWz2rXiHT5Ls8XtgdyXyLyQSY2jYkIIzKTp7aIQYL/oUdeBjK25CLIA8d4piIBSPhy18A==
X-Received: by 2002:a17:902:f54f:b0:240:1ed3:fc1f with SMTP id
 d9443c01a7336-2401ed3ff16mr35964315ad.12.1753663694957; 
 Sun, 27 Jul 2025 17:48:14 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe536e4asm40996105ad.163.2025.07.27.17.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jul 2025 17:48:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Jul 2025 18:48:10 -0600
Message-Id: <DBN9W9SJU6MX.F5UH2D1QCJNC@brighamcampbell.com>
Subject: Re: [PATCH 1/2] drm: Create mipi_dsi_dcs_read_multi()
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250724202338.648499-1-me@brighamcampbell.com>
 <20250724202338.648499-2-me@brighamcampbell.com>
 <CAD=FV=UZqzWd+Ke2sU-z86jnhKhUo8v0ChyKYnGpmx+s7n0stQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UZqzWd+Ke2sU-z86jnhKhUo8v0ChyKYnGpmx+s7n0stQ@mail.gmail.com>
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

On Fri Jul 25, 2025 at 3:16 PM MDT, Doug Anderson wrote:
>> +               dev_err(dev, "transferring dcs message %xh failed: %d\n"=
, cmd,
>
> Format code "%xh" is probably not exactly what you want. If the error
> code is 0x10 it will print 10h, which is not very standard. You
> probably copied it from the write routine which uses "%*ph". There the
> "h" means something. See Documentation/core-api/printk-formats.rst.
> Probably you want "%#x".

Ah yes, I had based this change off the "%*ph" format specifier and I
had mistakenly assumed that the 'h' was a literal 'h'. I'll fix that in
v2.

> I'd probably also say "dcs read with cmd" rather than "transferring
> dcs message".

Yes, this sounds more accurate. I'll include this in v2 as well.

Thanks for the review,
Brigham
