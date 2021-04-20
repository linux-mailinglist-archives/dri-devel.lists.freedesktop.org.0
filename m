Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1C365D91
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 18:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E675F6E873;
	Tue, 20 Apr 2021 16:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A406E873;
 Tue, 20 Apr 2021 16:42:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k26so21909517wrc.8;
 Tue, 20 Apr 2021 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r+E/kkjY9VCD+TDHQ25+3eYjqgcKsNN6xqcqIvblOGY=;
 b=EuO11aRwYnEDpISs0soIMRvGoq9agr6v5Q3Nb03JTlBEZu+ujxSB9SmQxWS0QWS84d
 Dc8FjQHYRRdHyu9A0OUwvZxjw/Q1bSjVo5qC1A6ExfrNOzU7Zphecwy3f1KCHpB1Ai4U
 D7Dzr2ip5s/EkLmKXUj1ZcQJ/Ol9rGQUnAM1ndlD4usQgIQOUqiPa2ZyMX1h7fkjFEE2
 n0heShv4GRO4JkmwZdOke2Zv/WeN/09cuWqYL4svY84bGfF2IUSh23tXe/KMdpMJ0ZA+
 9d4HUTHCcrjUpMOejzj5V0LPXzKm5WQl9pjKxYuq080g0OgWBdWPzLNgwRDvYkwMhQ9W
 Q4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r+E/kkjY9VCD+TDHQ25+3eYjqgcKsNN6xqcqIvblOGY=;
 b=qlpq9O4miNNghLS90BW1HrJQ8oxXSJPlvec9a0KjGK+n3xqaclRgR7qeQ4LZA5pNfx
 rnUIlkGEXctAh2hgBL6FqgsFwD8obj9tig2NfG1O63cPpCIRbpXux0Dur/0e/BqiTEqS
 LrkGwpCkMY6Y1393LMfiq5XqRZHmSr8EeytFyZkYOKNygSy8b3gPcO6d8RQtqsbkiECh
 FfYFx2Wjs9rBLWs42OmYjGew1SesoQs66U6aQqI9PC6lEVmDbF4/S3VZsyFjyWcWRMiF
 JOf+py4KAt+zOW0ALC2zJeIISF8CSby7K8s08qKob8jOeLzMqXu79zDv7/Tck7YtmoDN
 /0gQ==
X-Gm-Message-State: AOAM530H3egljPmf63mBCCxkQvhUzYZv6+0kft4oyk2YT3rqJfK0IkB5
 Pb9dK9DFKtAgzBhIoefa1MwVMfMQer0mzCEZ4nc=
X-Google-Smtp-Source: ABdhPJzGZIUoSuNBPLAx1v1wmIvoEGr5xlUCoPXfst/mHXI1yEBM3yTgtLYmx7IiV9+eKfK5q1AYP2pXUQ8cY1Yy+cQ=
X-Received: by 2002:a5d:6983:: with SMTP id g3mr21142799wru.415.1618936938026; 
 Tue, 20 Apr 2021 09:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rO7_Q2L0PogryGmuxLJk-DA3ckM+6vmDioErZ3_6s0iRQ@mail.gmail.com>
 <136d3b55-ff1e-c47b-d443-22bd27427956@gmail.com>
 <CAPj87rMSk+SgCBfrcQTEvppp=qQv4MRdeHRKAOUn5pZAEhh9mg@mail.gmail.com>
 <8e5026aa-599e-52d0-4959-6c3bcc16cb76@gmail.com>
 <CAPj87rMzFfouhv89-Vj3jDsH8JB5NFiyv+yV07KvJZaa2rB7Kw@mail.gmail.com>
 <CAAxE2A442Rkn5RfU9KH4cBzURZxqHgCX73-GVYrR+8u1cPXowg@mail.gmail.com>
In-Reply-To: <CAAxE2A442Rkn5RfU9KH4cBzURZxqHgCX73-GVYrR+8u1cPXowg@mail.gmail.com>
From: Jacob Lifshay <programmerjake@gmail.com>
Date: Tue, 20 Apr 2021 09:42:05 -0700
Message-ID: <CAC2bXD4M+hQ6hOdiyrQ26ozNbVZWGxTLsBCDeMv3OSzq02ShoA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0936973660=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0936973660==
Content-Type: multipart/alternative; boundary="0000000000001ad83105c06a21eb"

--0000000000001ad83105c06a21eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021, 09:25 Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wrote:

> Daniel, imagine hardware that can only do what Windows does: future fence=
s
> signalled by userspace whenever userspace wants, and no kernel queues lik=
e
> we have today.
>

Hmm, that sounds kinda like what we're trying to do for Libre-SOC's gpu
which is basically where the cpu (exactly the same cores as the gpu) runs a
user-space software renderer with extra instructions to make it go fast, so
the kernel only gets involved for futex-wait or for video scan-out. This
causes problems when figuring out how to interact with dma-fences for
interoperability...

Jacob Lifshay

--0000000000001ad83105c06a21eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Apr 20, 2021, 09:25 Marek Ol=C5=A1=C3=A1k &lt;<a href=
=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><div>Daniel, imagine hardware th=
at can only do what Windows does: future fences signalled by userspace when=
ever userspace wants, and no kernel queues like we have today.</div></div><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Hmm, =
that sounds kinda like what we&#39;re trying to do for Libre-SOC&#39;s gpu =
which is basically where the cpu (exactly the same cores as the gpu) runs a=
 user-space software renderer with extra instructions to make it go fast, s=
o the kernel only gets involved for futex-wait or for video scan-out. This =
causes problems when figuring out how to interact with dma-fences for inter=
operability...</div><div dir=3D"auto"><br></div><div dir=3D"auto">Jacob Lif=
shay</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div></div>

--0000000000001ad83105c06a21eb--

--===============0936973660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0936973660==--
