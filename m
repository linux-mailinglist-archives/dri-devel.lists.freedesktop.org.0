Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D591944BA6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 14:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8529510E943;
	Thu,  1 Aug 2024 12:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cwFvevRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0668E10E943
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 12:46:58 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-81f8f0197abso309710739f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722516417; x=1723121217; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wOxhULzxjTxJJtbNJjocbMaVH/+O6l5IO9Kn6swTW+s=;
 b=cwFvevRFOMGMfn3I6EDnjI3LQIiU8l+n/AyKla462ehiNh5bTd67OtRehfrQ1qUc8r
 3VIV8EXdw3rAglW7yWgAK9bzSi2cdAZJDyT8+b7YL9eIINkNEkFd6usoI3bbq3BdMxyS
 3dC8bGyXkPmFnEWGZcdnyznGs5Vx+y5b3rzmAYvgLcjpsvYFroCQA3CPW7Rikk1Kvznf
 XwRFcNKx7e+GNVxggGnUSVUG50lVWcYaO1nFvPuJQlzRQXSFzfDfhenA7owNh5D0ibKH
 U5QBTk6S11eoS0zGuQUFZngBeEySQ0iM4MsrEQ/rdSt0UGckKcEogbBIF/dHXItfWBj8
 9e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722516417; x=1723121217;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOxhULzxjTxJJtbNJjocbMaVH/+O6l5IO9Kn6swTW+s=;
 b=THbuJhXHWoyYKohNAPaNPzecKB+zoSjS7FzhqLJDBHYPfe9Y7L4DM4qrMtDcb1X5qC
 uC2F/sAdhFiuBwoBK8UJZNTOKZENNi4ryDpzTD/vCkyPgRUa9UrEQ/vanZD6CpAxr1+g
 y+z1g+gFb6++w+3hfU72rt9eXsZiStjES5z3YlySZk7DwQW2lcoeZpWK7KqXuGaWU+HV
 xvegoSDVqtka1iLWi68SXkO6qQeW+b+sax0fqxSdnXSCUp+nhy6vS3776QAq1xvWuj2u
 dijqdB0dEV8IXYs9Rfu8AjrAAGRju48M3ZchfvBiCJwc7FLH3lUKsWbMjGczo2Fsb7tQ
 +75A==
X-Gm-Message-State: AOJu0YypcQRtpaON7HJdNkxuJ5/STdKn6bhQiiLUClf/ooRcnAiDr5cU
 wa+tQbQv9EaasphtwU+QnWfWfUjNj16oDTcYrnTyYK3niLFOQks7nJTW8VD93lrcBlBjUP0JaA2
 qRYhuBXgUE9kZAOivyawHPGq10rk9jUuf
X-Google-Smtp-Source: AGHT+IEYm48S/rfgHbfVE0/jr/68ZJpPUmiXAQVrCO/LyYoNossHu+jYNqZMVhic96Z79CId6sia70Is6ej5qJbtyrs=
X-Received: by 2002:a05:6602:1641:b0:81f:cb5d:a5a5 with SMTP id
 ca18e2360f4ac-81fd4353a70mr23980339f.3.1722516416914; Thu, 01 Aug 2024
 05:46:56 -0700 (PDT)
MIME-Version: 1.0
From: 22-Priyansu Rout <22priyansu.rout@gmail.com>
Date: Thu, 1 Aug 2024 18:16:44 +0530
Message-ID: <CAHr33FQyxUtxxQEKnhUxgW5pYe541o97R156L_rUJ2mYWEsTJw@mail.gmail.com>
Subject: Introduction and Seeking Advice on X.Org Evoc Mentorship Program
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000266fbe061e9e9bad"
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

--000000000000266fbe061e9e9bad
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

--000000000000266fbe061e9e9bad
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
learning and sharing.<br></div>

--000000000000266fbe061e9e9bad--
