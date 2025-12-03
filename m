Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CDCA2E6B
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B62910E1D2;
	Thu,  4 Dec 2025 09:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LTFffXS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C573010E6E8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 16:11:13 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-37b983fbd45so45523941fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 08:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764778272; x=1765383072; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zq9tUMQT6d/G3L2AsbdU/1ctyeu4tLxDU5Snqvsg0gM=;
 b=LTFffXS+YIN6MHznNUT1SorI6xaNi76YnkK8+Kd04tLid4dM/bdQdxXAOvXSdIp5fl
 yOkeSmRpMM7KVSmEvU/hRcO7XPH9ecxOc71ijJvLrH9GpiE68n7mYrq9xTLhZs1D9x0E
 NQJY9jBEVNNLKfHhT24OqFNelPSHJ62ElgWPAvaJKCWG1VnME3Eu/dKOUjUgOEuz/L+8
 rS70+88UPwJ+In3E2g7O24hH7nFjjjaSe943C6gCUcWIAV8zv0ReSo9fBEJMlcqEJZOo
 GCNXRQRlbicWivnYGZCuAFFtOdnMpvunBx5sTyqk7MJFtD33o4uOJ/q5XkwgKt9HNwJe
 pcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764778272; x=1765383072;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zq9tUMQT6d/G3L2AsbdU/1ctyeu4tLxDU5Snqvsg0gM=;
 b=azMy1u6LEUZG0d7q3am/l8TPi7zbkbXCkkHFtvhWtafwQApF1+RrqIRONDge6/MIVd
 9k8FV2oCdhU5adWzCiuxNiuU6976R/FJbjgUq6EkTKt8NpiOyvf+DHX0axOHfL0bAKST
 kecPrxJpO4mYD8g195e5n8N0ywVQKnyGvVjBN4/dF/IycGhSPta8ZFSXXXkTtZAU4fW+
 AtRohG9uIy0QmMFkJo8o63d1zFUgJuM9enxgwopk9C2t+Xwvd2Gt09iuwrFXG5+Zat2P
 JWe4ad1ot57+FnCvxjvcYmdebRq45yw5pVwNazBUZCk5RPWD2slC5an6SalEHV8xIIKQ
 Q7aQ==
X-Gm-Message-State: AOJu0YxGyRlnorDpZjc7ASjOdhafpcKZr+NucL26tSEOYOZMijBqm99f
 8anyBB47UY4ta0n8kA3UqfHejOj7/vp4BGynkmRp7y8LuI71lV6lkpmk0CvzHTatG3annT1Kmow
 kuMignZG9xP5vwMxjDgMYU8cs9tgpgdL6+VUgpLQ=
X-Gm-Gg: ASbGncs1eeT/kEZ7p+H9Xe+BONGWg39VvGGxpF6D6YfgoDnoIGJdqNLQ7eLl6cSrT3C
 CYmy4i3r4gorYqagLntZrkPSARilUGROvjJ7MdpV4U5ZhwVjOgnODcv15ugGSX04TnTi0iWPS1s
 h5J2Vmt96iNyrvqiRXcRWYbWGE6GsbUpGFzKKWhwZv+6F0c8NZiJ808j/1KUJ5oIvNxzY230v2e
 Alcu7h+Mt2V53o0Bz3oei4rYXBd2zVH2RjO3wvOcyFs1Oxi6fd/VUZgNpvvgXsoRN5a1zg6qpn9
 5uAR4+F74+7GTYv0V1Yt7NC9q401nsOEJe9E9D3D
X-Google-Smtp-Source: AGHT+IEQFgwwZUq/5BZ7JBj1KuM5rkPGAoI/bCertr9D3Lft0Hs3BnPmKOY405NloFWIEOgjEhBT9UsqpDeiFLIEivI=
X-Received: by 2002:a05:6512:3c9a:b0:595:7cb8:3eb2 with SMTP id
 2adb3069b0e04-597d3f29741mr1192594e87.14.1764778271389; Wed, 03 Dec 2025
 08:11:11 -0800 (PST)
MIME-Version: 1.0
From: Zakaria talukdar <zakariatalukdar123@gmail.com>
Date: Wed, 3 Dec 2025 21:40:59 +0530
X-Gm-Features: AWmQ_bk3enodBs7ftmxQT1RWr9JscpgUWuEIqpLLqC8ZQYNPSYtixyc8LSyDf0E
Message-ID: <CAKFHAhauFF7JMUQ34v2_XFcd33vaYJy4hiMQEcynUsya5yz1nQ@mail.gmail.com>
Subject: Guidance Request: Starting Contributions in GPU Drivers & Hybrid
 Graphics Support
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000f93c5106450e7592"
X-Mailman-Approved-At: Thu, 04 Dec 2025 09:05:18 +0000
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

--000000000000f93c5106450e7592
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

My name is A. R. Zakaria Talukdar. I=E2=80=99m a Computer Science and Engin=
eering
student pursuing B.Tech and aspiring kernel systems developer with some of
the interests in Linux GPU architecture, driver stacks, and hardware
enhancement. I=E2=80=99ve been studying kernel modules, DRM internals, devi=
ce
probing, and PCI subsystem interactions, and I would like to begin
contributing in a structured way.

My interest is (for the moment) improving the open-source GPU driver
ecosystem=E2=80=94particularly around hybrid graphics (e.g., AMD CPU + NVID=
IA GPU
switching issues), GPU management, and understanding the modern DRM
infrastructure. This is born from my own frustration regarding my devices
and within a span of 1 year I lost 2 laptops due to this issue. As I'm keen
on working with linux so I feel responsible that I should fix that
and atleast help other people like me or even large industries and
organizations to feel at home with this beloved system.

Before diving in blindly, I would appreciate direction on:

   1.

   Where a newcomer should start within the DRM subsystem?
   2.

   Which documentation, beginner-friendly tasks, or open issues would best
   build prerequisite knowledge?
   3.

   Whether improvements around hybrid graphics (ACPI, PRIME, power
   management, muxless switching) are currently being designed or need help=
?
   4.

   Who the appropriate maintainers are for discussing hybrid GPU switching
   architecture?

Any guidance or pointers would be extremely helpful. I want to make
meaningful contributions and avoid redundant or misaligned work.

Thank you,

Zakaria

--000000000000f93c5106450e7592
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<p>Hi everyone,</p>
<p>My name is A. R. Zakaria Talukdar. I=E2=80=99m a Computer Science and En=
gineering student pursuing B.Tech and aspiring kernel systems developer wit=
h some of the interests in Linux GPU architecture, driver stacks, and hardw=
are enhancement. I=E2=80=99ve been studying kernel modules, DRM internals, =
device probing, and PCI subsystem interactions, and I would like to begin c=
ontributing in a structured way.</p>
<p>My interest is (for the moment) improving the open-source GPU driver eco=
system=E2=80=94particularly around hybrid graphics (e.g., AMD CPU + NVIDIA =
GPU switching issues), GPU management, and understanding the modern DRM inf=
rastructure. This is born from my own frustration regarding my devices and =
within a span of 1 year I lost 2 laptops due to this issue. As I&#39;m keen=
 on working with linux so I feel responsible that I should fix that and=C2=
=A0atleast=C2=A0help other people like me or even large industries and orga=
nizations to feel at home with this beloved system.</p>
<p>Before diving in blindly, I would appreciate direction on:</p>
<ol><li>
<p>Where a newcomer should start within the DRM subsystem?</p>
</li><li>
<p>Which documentation, beginner-friendly tasks, or open issues would best =
build prerequisite knowledge?</p>
</li><li>
<p>Whether improvements around hybrid graphics (ACPI, PRIME, power manageme=
nt, muxless switching) are currently being designed or need help?</p>
</li><li>
<p>Who the appropriate maintainers are for discussing hybrid GPU switching =
architecture?</p>
</li></ol>
<p>Any guidance or pointers would be extremely helpful. I want to make mean=
ingful contributions and avoid redundant or misaligned work.</p>
<p>Thank you,<br></p><p>Zakaria</p>

<br></div>

--000000000000f93c5106450e7592--
