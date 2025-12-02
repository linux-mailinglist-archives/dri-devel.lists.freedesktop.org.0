Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBC2C9E272
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317E910E00C;
	Wed,  3 Dec 2025 08:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dWv77qX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2599710E68B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 17:02:26 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso431875066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 09:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764694945; x=1765299745; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=myTLFLpLAlmFspa46GVYPcd280vbe7QCCYuudd6nzhY=;
 b=dWv77qX9hf1j7BR9W2dIMD2sOqlbyygJClgcyVqP/bNk+bchjuM8P/LfFW1bbdtXUY
 H9cvqla5pj1iWCZAnNSxpEmWVrqgJ4cBgaiW52oQQrH/N8VlIoDX+ka4I/LgJGiksapy
 +9e+8k6BzL7Syr5cXEPD/PPkwyoqDrKX5khWaKWnCGBB08IeJt1nR5uLJd0nNmPqkwMX
 cy4qVkDU1Er3qvHAWSIJLDECLaqjjMzsMPyvGrA19sABbR2Ig/v3m+3o2/9+8EWmTapW
 7WD+Af1YDHauMFNkwt3u3MremFZBFcfwLQ9VzZvSq5q7t6hFlpOBsVpYCXgwql6SL/lS
 xSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764694945; x=1765299745;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=myTLFLpLAlmFspa46GVYPcd280vbe7QCCYuudd6nzhY=;
 b=nRgM4Kqqq3Y1mdV8uV5PFEUXchHnF+mZ9EHnHrj+VY7Vi95CH15OxdCKvPbdM21d4W
 L7DyNF/Hro2pPpL7SFbzB7LhRHO2SpNyBWjhuBuaKOkx87+g7vFI5R/doxzuVZiEc+sL
 i7hEmGs92cbfbocPaMtKfbDXkHB/kYBkJEokWyRT6EgNAh2DiBYNX7/0zfhaXOQAlr4m
 SgP/J62qJtwDc1olvfi0L63fJR578fq70NXqNj8AeTiZkIH04F75ETqFUUbD8ruqZzhl
 x9obv+TleKOxYbiydRTBVWKRATNVQRFknZNRqJ6CXWV4s7nQQ+q37brLZ8BraOxaBDim
 ce7A==
X-Gm-Message-State: AOJu0YwnMAn8H4KDyJus/o7LTEODtipr+HahD7Dq8KvxFwOd6R47arzQ
 phfvT7iux6E2YP8oQEokVlJHEPl4UWo6xmv56P/M1wGkFmgPupDpAaX7+6GE5/aEtBU/bs/iGJh
 dQPKOZP9uOZWFbAOkq6bBJQRz1yH2ZBE=
X-Gm-Gg: ASbGncteIl+deWb2r/4XP7sd7JxwLEa+lZfkXNuWwgwcruWgTNmBhIhrZPNo6bhhiPv
 egPforMqkcA89v+vr5zRxyfRboTcGxxmT3LbgzFujHlUMX7dttGDaI/f9vx40SLBYi4ZbzOyNz6
 gAkk4RkbcFJbltVrskLzVCc90XQKNaLfUiqiliU5JMMcMwLSxtgy1qqPbQqLeZKeF6JcQNktwn9
 yy+bnW70aWvrBDhChr4h5ymBsFHMUm7ayQEKFjTS872mupni0//Yu09RdUfeTmRmY+Hp4QRVDPl
 enmwRmos0CMbJJgXxAeaO2gSmeI=
X-Google-Smtp-Source: AGHT+IE/PTWNy1q5xhx5/0yhcOfBwkkcqTd+YRzkXSn1ca/dbvTbJwPrZqnWeQhE6Ga01tymOdRsUZNuu01gW3q8KmY=
X-Received: by 2002:a17:906:d54e:b0:b76:5ef6:3b73 with SMTP id
 a640c23a62f3a-b76c54b9c6dmr3064419666b.23.1764694944249; Tue, 02 Dec 2025
 09:02:24 -0800 (PST)
MIME-Version: 1.0
From: Tommy Lee <undertakelift@gmail.com>
Date: Tue, 2 Dec 2025 09:02:11 -0800
X-Gm-Features: AWmQ_bkJi_REpo9gv9AUX-3oOKZAGnjC4NS5ktf_FnBaCLSXigfIWyCwYjO0gKc
Message-ID: <CACdF58_ZzgwpwuRkmtriPVC81cnoU3T2Ep2Q1fL=2WpcBR5N6g@mail.gmail.com>
Subject: Re: [PATCH] accel/ivpu: Fix warning due to undefined CONFIG_PROC_FS
To: karol.wachowski@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, jeff.hugo@oss.qualcomm.com, 
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com, oded.gabbay@gmail.com
Content-Type: multipart/alternative; boundary="00000000000049f9100644fb0f08"
X-Mailman-Approved-At: Wed, 03 Dec 2025 08:11:25 +0000
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

--00000000000049f9100644fb0f08
Content-Type: text/plain; charset="UTF-8"

Good morning to you,I been working solo on this but I did a little
adjustment to make this work and if affects anything of your work please be
mindful and you can change it back to your settings to however you like

--00000000000049f9100644fb0f08
Content-Type: text/html; charset="UTF-8"

<div dir="auto">Good morning to you,I been working solo on this but I did a little adjustment to make this work and if affects anything of your work please be mindful and you can change it back to your settings to however you like</div>

--00000000000049f9100644fb0f08--
