Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B588E59ADE2
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 14:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C6B10E100;
	Sat, 20 Aug 2022 12:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F7C10E0C5
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Aug 2022 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660998180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=DXg8syq7vKWHepNmDIIBfjO8DD2VoQbqGSBWrZ4PgSk=;
 b=VlKny41+CTFBEny1YWtIQ3KV8X3UlNuzqXgh0sqgjHGoWjFcq2Qlo56eHfXvo7bGXUgEg5
 vOkUTlFibp1c59b5XGfkhg3H67cXTmgMBQybVxEA+0rG3lWTc4T1P3nOVSor2poUYw+1cl
 wCJPnAYeYkl0bLjF8tVvFYHg6eDsnFs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-ywWw2Or8PaSaI2j6qEkx9A-1; Sat, 20 Aug 2022 08:22:59 -0400
X-MC-Unique: ywWw2Or8PaSaI2j6qEkx9A-1
Received: by mail-qv1-f69.google.com with SMTP id
 n17-20020ad444b1000000b00496d5b41d37so199395qvt.6
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Aug 2022 05:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=DXg8syq7vKWHepNmDIIBfjO8DD2VoQbqGSBWrZ4PgSk=;
 b=Aj4XNa51zJimCS7fWuJ1hRTBg5eMYKXmuoT8RnJunFYKw8mP8hDls5MAAW75adGETi
 WrFFxT5VeEB2xkxPhwae3xq89YUcc320c7+HEeBGjzReUJtBYZT/HRjGKzP0/IsOn+BR
 WnzZhLAbHV/lthCLCq+ERl9j71jkuDK0vy0HmNlBoDdju0Lo395WVtuSIihjI1mfrfrS
 HqHKOMGqHR1uxiyYeI2Xi4zNgDifWfMF90MjdRaSlK/kTZZntNsmMU+gf1nuvU4LAfiF
 0JaVkmC/Jb5GJEELA+D66Ik7nz7I8H7AK+hT7efpv8B041H/5IUggvf82gphc6zkvgt5
 sHOg==
X-Gm-Message-State: ACgBeo00rw0K/nIACrnaFwsnXFuJznPYEE0UEk2e3aFv7U2Aery5aiUg
 JStmLHlY5lGYSIWE4WrcpfGOiGkSEbE/zmXFmSHhG8cBq3n13KXQgGPPctA+TajzzCN5BatCf5n
 T5CBcuC7j7CFD3Ulk8eDwCuG0hkdiRngnCR9Da2XlFt50
X-Received: by 2002:a05:622a:53:b0:344:6f46:9b16 with SMTP id
 y19-20020a05622a005300b003446f469b16mr9697670qtw.664.1660998179323; 
 Sat, 20 Aug 2022 05:22:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR61zLVp1KxD7rB1DXUOXcyn8HWpdk1685zUTy5niWrvAVx6Oqq+Vu6upiINxfBqWoGk+bML0SHiRRvJcGi7i3Y=
X-Received: by 2002:a05:622a:53:b0:344:6f46:9b16 with SMTP id
 y19-20020a05622a005300b003446f469b16mr9697654qtw.664.1660998179029; Sat, 20
 Aug 2022 05:22:59 -0700 (PDT)
MIME-Version: 1.0
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 20 Aug 2022 14:22:48 +0200
Message-ID: <CACO55tspZpSCE7U1WB2QRExXe=C8E51Vj3Ss9=K71QWqP8MxHA@mail.gmail.com>
Subject: Rust in our code base
To: dri-devel <dri-devel@lists.freedesktop.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, jason.ekstrand@collabora.com,
 marek.olsak@amd.com, Maxime Ripard <maxime@cerno.tech>,
 Alex Deucher <alexander.deucher@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey everybody,

so I think it's time to have this discussion for real.

I am working on Rusticl
(https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15439)
which I would like to merge quite soon.

Others might also plan on starting kernel drivers written in Rust (and
if people feel comfortable to discuss this as well, they might reply
here)

The overall implication of that is: if we are doing this, people (that
is we) have to accept that touching Rust code will be part of our
development process. There is no other sane way of doing it.

I am not willing to wrap things in Rusticl so changing gallium APIs
won't involve touching Rust code, and we also can't expect people to
design their kernel drivers in weird ways "just because somebody
doesn't want to deal with Rust"

If we are going to do this, we have to do it for real, which means,
Rust code will call C APIs directly and a change in those APIs will
also require changes in Rust code making use of those APIs.

I am so explicit on this very point, because we had some discussion on
IRC where this was seen as a no-go at least from some people, which
makes me think we have to find a mutual agreement on how it should be
going forward.

And I want to be very explicit here about the future of Rusticl as
well: if the agreement is that people don't want to have to deal with
Rust changing e.g. gallium, Rusticl is a dead project. I am not
willing to come up with some trashy external-internal API just to
maintain Rusticl outside of the mesa git repo.
And doing it on a kernel level is even more of a no-go.

So what are we all thinking about Rust in our core repos?

CCing a bunch of people who think are the most impacted by it either
from a reviewer/maintainer or developer perspective. If you think some
others should be explicitly aware of this, please point them to this
discussion here.

Karol

