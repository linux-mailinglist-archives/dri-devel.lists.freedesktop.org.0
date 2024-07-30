Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3C941FF3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 20:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9504310E152;
	Tue, 30 Jul 2024 18:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QrKq5odj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B27410E152
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 18:45:34 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3737dc4a669so23376155ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 11:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722365133; x=1722969933; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j2VUH0K7Aw3sXzHDRfDHPcuGCljZt3W6E18MHcVJbyg=;
 b=QrKq5odjqg2AKRMOqXAKzEvQn9klWGNq3SDMI2eTiroHsLhk74B/QN/XJLGNPAxkox
 yI6Bqmk4WJGRb7EnFueYPqSDiBkfN3Ppeb71Nill4R8rZnl8PjVrwOzWvZua/8tB9yOZ
 CawKaBja5Bi2J88U6pL1YUtcmuVV6m0djGDJZTbj+OykXpTis5NHokBhl78dietBeLiT
 Tisi8cujypFGZwpramexSbiZOf8EjV2kG8ffTKogDKg4kl0WAmdwFNvlRt3iPkAqHnrh
 /wr3T1exDZOdu+QU63WttDjH9HNLFZ0vDVJgi0xXgd1hXD+YR5JgIDFeIGgG+HpU+flQ
 9YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722365133; x=1722969933;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j2VUH0K7Aw3sXzHDRfDHPcuGCljZt3W6E18MHcVJbyg=;
 b=OlgJXb504Mt6cwCXmTaPpFDrNp1weumAPb6lGvDLFSZ44KNNLDL+tQyOk2Bb2+ErW1
 6c+yhRyGEcPKLqMShEyLd8jC0tMO07Vlozf8l/RN/7mEsvCkFONSSzRkYCTJFjEGRPwy
 HbM3g56vZdavSLXDtjkJkMWRzxgQx0G32EK4TBnQFJO8vsxFXak3JTApLgxWUM0jAjH2
 VfAKvLKgVo1II4snX611nni/aEEijgtJJMDBhm2vycheVUiRfV2C4l4qj36/wJQJ3xTH
 iEPxOdfEOpESlJ4IqmLRYHQPHQBnZr5w18acJMfaTdRwC1WZ46YasYKg+xVRqRd+fM5V
 89Pg==
X-Gm-Message-State: AOJu0YwRanWeeEdBW1/iGmyg/V9/KACYaCVZRqhvqsJb6W+bGtiVw1Hm
 gbxyrhrFTACfV5KBThNAhJ6TCyRCiRC077qh5otMvHdBijAitINHVX31BFcG3w1+myuGQGd8o51
 Ov8UpRxqImZ72rPmkWse2p5vBLJNg8Q/Z
X-Google-Smtp-Source: AGHT+IHQi1zmp++y893rvfP6Hajw6tOrCPBRJl/T0/ijI1eAI4J1yUTMq08Kro3OWAiLSgazvBEaD7leVDTCblWdfwA=
X-Received: by 2002:a05:6e02:1a6d:b0:39a:ea20:bf7f with SMTP id
 e9e14a558f8ab-39aec419d4cmr141674465ab.25.1722365133200; Tue, 30 Jul 2024
 11:45:33 -0700 (PDT)
MIME-Version: 1.0
From: 22-Priyansu Rout <22priyansu.rout@gmail.com>
Date: Wed, 31 Jul 2024 00:15:22 +0530
Message-ID: <CAHr33FQ8q03_4+Ev6Nv6KC4_JS3Ab6uWMFsBoHgUXn6dGsWU9w@mail.gmail.com>
Subject: Introduction and Seeking Advice on X.Org Evoc Mentorship Program
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000f02c9a061e7b61d7"
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

--000000000000f02c9a061e7b61d7
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

Hello, my name is Priyansu Rout I am from India. I am right now in my
second year of B. Tech in Computer Science and Engineering. I have been
developing in blockchain projects and now I would like to get experience in
X. Org, especially on the kernel level.

I am very much interested in being a mentee in the X. Org Evoc Mentorship
Program. I would really be grateful for any pointers on how to proceed in
contributing to X. Org and how the mentorship process works.

Thanks for your time and I am looking forward to enrich this community
through learning and sharing.

--000000000000f02c9a061e7b61d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<br><br>Hello, my name is Priyansu Rout I a=
m from India. I am right now in my second year of B. Tech in Computer Scien=
ce and Engineering. I have been developing in blockchain projects and now I=
 would like to get experience in X. Org, especially on the kernel level.<br=
><br>I am very much interested in being a mentee in the X. Org Evoc Mentors=
hip Program. I would really be grateful for any pointers on how to proceed =
in contributing to X. Org and how the mentorship process works.<br><br>Than=
ks for your time and I am looking forward to enrich this community through =
learning and sharing.</div>

--000000000000f02c9a061e7b61d7--
