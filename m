Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825AEF71B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 09:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA716E91E;
	Tue,  5 Nov 2019 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF19D6E91E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 08:20:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t5so20758216ljk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 00:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=hOBPpNgjamNtOM/56m1s74hpsCTLQOfrzv14+A8nUoE=;
 b=ZNPweZRBAu4Om45FlxBm9xF2oylYnod2RmDPCf+zenIK9gOyLg3G6HnhxvxxT+Djj6
 5zY5e+J3BmGyqwN946xgwCDxTm2A6mTm2cSJrUEbIDx4z3ei46k2D7uR+JxcLatrHagk
 7HbIQuHguaUHmLD75vlHLl0R31W14n8eD3PV2ak0czBofg1Y9CsE6Xl5h7uMnSZgjbbP
 aXniUi2lt+PeBx9a435n86nQWmOuADDbhVaAi4jVSlwfXYxE0CTLs+PG1bZS5XRCnLRq
 UdOOolGnXPstnQMG5b8To7s7CxOo8wvY0wuuKxcei1JCTozIUpm9D4+tIkYoxP2/2Czf
 kGGw==
X-Gm-Message-State: APjAAAXGarj1mquTG5puTgByiyYV/P1I2pF2o8+F/Z7RJntJmnx3W7Ef
 TpY7BbLxjOg5MoPlWsiIa0g=
X-Google-Smtp-Source: APXvYqxY3So/pXQMDbvXGa7Gq27XWwa1osQFBbO7FEXUMlzxzsKuRYnolv7J4f5LQuBBFzE1/EgVxQ==
X-Received: by 2002:a2e:9802:: with SMTP id a2mr9578064ljj.254.1572942005107; 
 Tue, 05 Nov 2019 00:20:05 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j7sm7716656lfk.17.2019.11.05.00.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 00:20:04 -0800 (PST)
Date: Tue, 5 Nov 2019 10:19:54 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v14 0/5] DMA-BUF Heaps (destaging ION)
Message-ID: <20191105101954.7d392878@eldfell.localdomain>
In-Reply-To: <CALAqxLXYUKNGebU6ZBVsX5xQ_hUL+imxcyOkuV5M10UxdpZuSA@mail.gmail.com>
References: <20191101214238.78015-1-john.stultz@linaro.org>
 <20191104101807.79503286@eldfell.localdomain>
 <CALAqxLXYUKNGebU6ZBVsX5xQ_hUL+imxcyOkuV5M10UxdpZuSA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=hOBPpNgjamNtOM/56m1s74hpsCTLQOfrzv14+A8nUoE=;
 b=TUlEtWXjHP0mBbpS8IOR52DaLKV8MReXgJ15LC4SdXlb+vyjK5hhJLyalgNp+yZQI5
 6fwviERcnJJwPuFQMZf/YoOyBIEGdGkHuuIncYXypVIkAopY1WOnuYWDMKkBzPCw7Nyd
 GHNsKRNqxF7chDZxsCqRqAfr1ZUx7yre1w3CM62JaBAnunW/ZobeYlzvDAyUqGt7RCn4
 20o+VjhVPVTlLFiGR4CxOdieTcyu6JpCrmGFoadx5yBK90R028Nx0KaPhV7gubrxH+Kr
 iRuOplnuDFDBrRaqwqwMxrLouvWmV7prfRDNH218D1+IJ8+ZV1/1pi6jfo61kG+9Zzo7
 oWUw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Hillf Danton <hdanton@sina.com>, Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Alistair Strachan <astrachan@google.com>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: multipart/mixed; boundary="===============0507427859=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0507427859==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8p7cpdYlML1=fi4l0IRs+aW"; protocol="application/pgp-signature"

--Sig_/8p7cpdYlML1=fi4l0IRs+aW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Nov 2019 11:21:21 -0800
John Stultz <john.stultz@linaro.org> wrote:

> So apologies for the confusion. I do believe I understand the
> requirement now, and am doing my best to adhere to them.

Hi John,

that's cool, the kernel regression rules are so strict that any slip in
userspace projects can seriously hamper kernel work, so I'm kind of on
the edge now that I've realized that.

> That said, given different userland projects use different approaches,
> I do find it a little strange on the insistence that userland patches
> cannot be merged to their project before the kernel changes land.
> Obviously no interface is final and any userland that does so has some
> risk that it will change and break, but there are many cases where
> distros support new features in their userland not yet merged
> upstream.  Ensuring there is a real opensource user for the kernel
> feature is important, but I'm not sure I understand why the kernel is
> dictating rules as to how userspace merges code.

My own understanding is that if a userspace project manages to release
a version that uses new kernel UAPI which was not finalized yet, then
when kernel people fix something in the UAPI and attempt to land it,
the difference will make the userspace now break because the feature
does not work like it used to. The userspace project is already
released and in the wild, so it cannot be retroactively fixed.

According to the kernel rules, any kernel change that breaks existing
userspace, no matter how wrong userspace was, is the kernel's fault. So
that means the kernel developers cannot land the new fixed feature, but
will need to figure out a way to expose the new feature without
triggering the new path in the userspace project that jumped the gun.

Often the breakage is not found out immediately but after a kernel
release. That means the already released feature will have to be
reverted, and then figure out how to re-introduce it so that it does
not trigger the userspace project that jumped the gun. This obviously
affects also userspace projects that wanted to use the feature and did
not jump the gun - they do not break, they just do not find the feature
anymore and need to be fixed.

In my opinion, saying "do not merge" to userspace projects is better
than "do not release" until the UAPI is finalized in the kernel.

I'm not sure it even matters if the userspace project makes a release
or not. All it takes is for someone to grab a snapshot and distribute
it, and for someone to complain.


Thanks,
pq

--Sig_/8p7cpdYlML1=fi4l0IRs+aW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl3BMKoACgkQI1/ltBGq
qqc4jg/+PB9tTC08XEWj7rGFDj9wD4VJxB0c8IWwnMyVF0Km0kSm3+lujVaGGvBC
rsir9uK5W1NLuzA8GdLX6bMCZlulF3GQX4EhnAfm7CEuuoVDB4HY7XVZlLc5Je/y
oQfs+ujw/ASZJ+lU66zkKiq7z5QfwMpnbg5yeJ1wOWt14lo042n71Nf09VoOuCKJ
DU2ZByuQBXfDMFrE62qae6wquH1m4SSr8DzzQdaA3Z1lSKun5odADjTEsEs2Cu2u
lBtge2tYdAW27nJeKYkk6+HhazVYt/gzzAikEtCFMnVVPLh7+5DrpJwIVZXOH6aw
qt2FZw1LOaJQRMSuXfRNYWVJM1ua3KVrBouToGoeuSmtqy3jz8c7rBu0EADlx3xR
mQv1kMXvzWjtjTRu3dSQwg5X7A0idPSn+OP/nkMNXY1t4kD9egVyBitfvJtlyxVO
5/u3AdLpt7bHexoiUjrdln85WjF7T0LaPY8OMMTDcmu1MTUUwcqB6oVvhckSwM77
oUTcB2TpP1k28yLy0v6dgdXOykE81cjiB5rW2Q61oGFlROSsVs+pEDRKYscMNdga
fLgNWjDHmPfzMlHBvzJc5dlr/rZg6TtwsCEzr7uSe6tEaz5CwLJsKSG6Y+34+oUw
sdI2GLkuX9b5Bw5C9QBKQSOCTqjb4WcaJ4+rOKLKNtCDhyNNZq8=
=XdQI
-----END PGP SIGNATURE-----

--Sig_/8p7cpdYlML1=fi4l0IRs+aW--

--===============0507427859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0507427859==--
