Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72627751A2A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871DF10E61E;
	Thu, 13 Jul 2023 07:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A9210E60F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:30:17 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-262e89a3ee2so129497a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689233416; x=1691825416;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hehZ0jWWsd/gtz/heWZOKR4zS5zY3zOuJU632AJXifo=;
 b=mKopxUmMOnMWEG0h5SMdyK79sxdXCfUi846oW1rAACiqEGb7DTFCtmh/8RDOXt/8Dj
 BpXTquxXY300UBMFqnVvB3wMTbchrqpO6CKp0Y7ySzxeC7iujJm2vDhYBEUIzVJMeQeQ
 CPZIQWYAI4f35nqhoZK6vuZ9L5pabZvS10h6EcWHs6fIfoNps1InKFilSAOFP8bjv2Z8
 Xc16z8TkZFZE9zdt+KduuYtlrReYgXiUpI4BxS7Vo3gtDPnK1BB5xlix9Y+LDcu9TsTR
 3eVsBwrcioBv3hD8Hnx/9LSyBxhjEf9R8b7C7qQ1IIhrp5V0ERjqcXkpBmHQbesWGu0V
 p9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689233416; x=1691825416;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hehZ0jWWsd/gtz/heWZOKR4zS5zY3zOuJU632AJXifo=;
 b=OUSP9bC+UwEdzlje/9gHOnSecFj+nYGkB7TuUpX2L5vOxMG7vRORkMSR98rqT54jrA
 faLh1plOlNlcOlDwnKX5WhRR+KdAvYSut3Z5hVHu+8SkgHawUGS0+kiPmTud2b+EYhNe
 +1ZpIP+G6YSyNjexcxms+P9UufU6YOqAZfGgvWe8Te7my8YTCud9FCjTQtrwNrzs2b42
 SWztBAGXLzngR+kVxEIGCBgHQ5T0An9LHO+f7XLYwIS1ndjVBB/aUjY8czppuHWmLh0c
 kCdK8Q6ynJykZQ2Rlzw28xJNzLH6+NKSoOgQKBB4waxsPbW6XEmHPZYw6tXEFAcBXb1r
 z12w==
X-Gm-Message-State: ABy/qLaKasNZQbR1FmIMEOZVBJEHtxxOC5VlfO65RLbj0sPYZoGqPA8D
 NCZSnnt/pqVffpTqNMotOgPUMyfvSzgK0q7i/083T0oO
X-Google-Smtp-Source: APBJJlHsAc85A623A3YFZzm6rhOc87f3l2eLif5yqHVZgb9EmJFjfUvDbsLG83ynkZlXBmF0RXoJC942sSEkcCJt3js=
X-Received: by 2002:a17:90a:7024:b0:262:ca69:bf9a with SMTP id
 f33-20020a17090a702400b00262ca69bf9amr245695pjk.21.1689233416503; Thu, 13 Jul
 2023 00:30:16 -0700 (PDT)
MIME-Version: 1.0
From: SUNIDHI DIXIT <sdikshit786@gmail.com>
Date: Thu, 13 Jul 2023 13:00:04 +0530
Message-ID: <CAF23GwBA6R45968qDv4v-r+sKicjojVifqGsEDh8=F9RVkJ1Hw@mail.gmail.com>
Subject: [BUG]: Getting a unique connector name when identical displays are
 connected
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000bbc6f70600594d60"
X-Mailman-Approved-At: Thu, 13 Jul 2023 07:44:19 +0000
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

--000000000000bbc6f70600594d60
Content-Type: text/plain; charset="UTF-8"

Hello all,

This is regarding an issue I have encountered recently in drm. When I
connect two identical HDMI display(with same resolution) there is no way to
distinguish them uniquely.

I looked into that and found that the connector id, and connector_type_id
can be changed based on which connector appears first to the kernel.

Is there any solution already implemented for this problem?

I see following solution to this issue:

Assigning a unique connector->name from drm_connector_init() and adding an
api drmModeGetConnectorName().

Please let me know what you think..

Thanks in advance!

--000000000000bbc6f70600594d60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello all,<div dir=3D"auto"><br></div><div dir=3D"auto">T=
his is regarding an issue I have encountered recently in drm. When I connec=
t two identical HDMI display(with same resolution) there is no way to disti=
nguish them uniquely.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I =
looked into that and found that the connector id, and connector_type_id can=
 be changed based on which connector appears first to the kernel.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Is there any solution already imp=
lemented for this problem?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I see following solution to this=C2=A0issue:</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Assigning a unique connector-&gt;name from drm_conn=
ector_init() and adding an api drmModeGetConnectorName().</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Please let me know what you think..</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks in advance!</div></div=
>

--000000000000bbc6f70600594d60--
