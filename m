Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A061FA24FE8
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 21:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF02910E02F;
	Sun,  2 Feb 2025 20:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WI+5lVa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3989410E02F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 20:15:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so589459666b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2025 12:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738527326; x=1739132126; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=atAmdxLrk4al6aiauqsCxWRu4+yuBggHzKn+HIqd9X4=;
 b=WI+5lVa4DfL3AbAWAsMgcUhKCKMudWTUEZEzfvgga99KBXbYZ/CCJWxuAH2gsD5kSB
 RYcIZeytEYqh5evawHOqupVAKQDBqhOQCwIeEpgx6AxmTCZ12yN8y9MzIIMLh4Q0yDP8
 iJyGnG7grB9VY+ZHJaGp1n0/cVTm5mSqElXo6s0acfSmoew6s0kJu4nayU6HMqudqiLj
 c1SAuCBJWPEGX2OU8OVmqAWZpP5dOj34f1J3N4Xm1ECgQ/vuPfipL8G8HabJDengaMAG
 HoMEEqBlIynXF1V3qO4V/wobGjgrqqRI1ocbrTGVNGRm2OGuIyQc33mN6xrwcNaan+Tf
 JjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738527326; x=1739132126;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=atAmdxLrk4al6aiauqsCxWRu4+yuBggHzKn+HIqd9X4=;
 b=cu3ihdzjOTevS0h+0BPuoQrrRSqhXCEtvjw07Xuorpgji+h25HlIjFrExDyI4a7C47
 EYNTx/HGtNZg9VJAOQpzpFQdZOyxIiZ7BxPax+TkZGoLnJYAlj4+pExJBpliIno713Dg
 Lwf0WX08NG7/s8sGrEorc0Z9ZR44dq4rxti/eQPV+/2O89CbWikLfT47IHEf6nWfNnk4
 Fihp1K1iRo/rEyn7lEnsh77xevqvFp192ETDaDBDPLya9nHgioqkvavZ3QEvz1y6QLyY
 td9q3qc+pOsyUqu4874dFNLDgES+90aB5CeGqiPRbEO3gl+LXBzbRtXytMuQpjvbggSn
 oj3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgGd6S3O1xFBN3DBVwu/g7RjlMLHXycPNWxrXkOaJdjkTGRkW19zN5njILrowyuTsihv6cZxjQ134=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHZbrDAoHRVLyDrrB+FPIKA81K8R9nFmSc2JYpZOd8TWlyKlyP
 +WodVWQgGZkhooPk1crk9QZsiaMTLLgxhV9xaMuRbXVte/rNLTkMLAxwcgj/S2vkBAfnWBHXrn7
 aSjLUNqWYHH/KRXtRBB/hB6/AY6U=
X-Gm-Gg: ASbGnctWGfL40hOSi95/Qahi66QcWN134K7lpCLpHhwoBSaLSJ2L6c1KV7wbtK/3DZX
 dTWVxiJxp8fmoFwR8DlEaoCBLsPrd2YB3Zj/TCPi15kYM/JJD9HQR1/ABomJ9e7hgU1vKyxM=
X-Google-Smtp-Source: AGHT+IH+a4W3Slx1nCQRwarJ8anf/llnBH/ZD6Z/djroBkAotBakLZQcMBXZAkQPVOFYf7OG4ywRycqAWo+iFSo3n0o=
X-Received: by 2002:a17:907:9452:b0:ab6:f99f:45e0 with SMTP id
 a640c23a62f3a-ab6f99f5410mr1456779366b.37.1738527326180; Sun, 02 Feb 2025
 12:15:26 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 3 Feb 2025 06:15:15 +1000
X-Gm-Features: AWEUYZnXJcy-i6ddbTZXPd1YVFUR8YJ_IoyZNoKtgyuZDoOQfWtBETPwg1zkLCw
Message-ID: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
Subject: question about firmware caching and relying on it (CONFIG_FW_CACHE)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>, russ.weight@linux.dev
Content-Type: text/plain; charset="UTF-8"
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

Hi,

I'm asking to see if there is any chance of consensus on having a
driver rely on (select) FW_CACHE. Nobody currently does.

Currently FW_CACHE is an optional feature (that distros may or may not
configure off), where we will cache loaded firmwares to avoid problems
over suspend/resume (and speed up resume).

I've just discovered a problem in nouveau's suspend code when the
FW_CACHE is turned off, it tries to load a few in it's suspend path
for certain scenarios. Enabling FW_CACHE fixes this, but I'm unsure if
that is considered properly fixing it or should FW_CACHE just be
considered an optimisation.

Do I
a) select FW_CACHE in nouveau Kconfig
b) fix nouveau to avoid loading the fw at suspend time (effectively
caching it itself?)

Dave.
