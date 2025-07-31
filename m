Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D4B16B2F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 06:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEB410E5A6;
	Thu, 31 Jul 2025 04:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FQFS2wub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9B10E5A6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 04:32:06 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ae36e88a5daso94419366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753936325; x=1754541125;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JKl/pMmd47NVhGRT8Fp3Ui4+sG0khep9g6c9Lmy2ESE=;
 b=FQFS2wubfXA3POmzFaG25Ey1rjLgbWpK3CpVVnevBZFjrzZXpELQ0LtlGih7NVDAX/
 idzM3EjnpxJ4sSZnMURZybF500c1ztWI4pDyTIvUYujj0XslZ3DvljC5394KBQKcrxu6
 5FyGrOBPXJnPl0niNqYPCF68AXl49E0Y2HqQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753936325; x=1754541125;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JKl/pMmd47NVhGRT8Fp3Ui4+sG0khep9g6c9Lmy2ESE=;
 b=DXLa2oRCTEoLhdxvZlUItHqqgK54zffnnvfiVOtriJkGKvAadI6CvAw5oN8Uj6d+q4
 9WsKUDLrJh+lWv59T8gUUJ6soDXYOEp+9kMwYqh4P+0NPn7kP3gQ7mksw2986fw2GzlL
 eo8FSUUKMr0lEEuXCprzgwfPiEMdTJGhhZmLpLYdVaNh2WMXpo85a89XLv5vk2eJ77aL
 td6pXZUR4bkl2ksc86/D35dupyfaGI6c1+3AtH6/iVW7Ov/0s4eA5plk0tnCFd5J9j4G
 IpnFoFTgGc6+qtl6MYIPS8SCya1MruBAwpbAcSqn+4+kj2WY6OX0uxQG534gWE9pXrzz
 7j6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaWGI5mXvmJTYh4cYzgYETdh204NcAY3rz9ahxmq0bhX1xd9Si+xKNUkGntLzsBpCJtQjtJk+Hsuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf0CkCGrVZ024hLrL0efxWVaR5hgLW1keGPw6xjjalytTUx/g9
 25buMGawb2t2mayxJgKaorwbgKXSr+64LK3C12BKaYOzCNFQQrNAwR1DN8CutmmWFwWjK034xtE
 j9lhdE/w=
X-Gm-Gg: ASbGncs4xBoIrOtmI32QHqikGARtfmiVLcOtAbGI4TSkjOPd4gL9HhGDSDs6vyj9DzK
 oNYP3ukRAXqBH7HcA4/x7ZD4wKYtd4Y98rEdSW0ShuJxq+Nfb1nn6X9k+me9AFp0RFcm7nXs/HF
 psx/Vb67C7XEFqmfG0Az9YafSqt8QsY+GAbVr0okAVEYh7xWTGMYI3KJF2xctxPr04aLBJdV353
 wqE+CSCDsI1VXspy5wLF8XVD29peEuGhEnBXRyQKgA6+ArUaOjQxMMNbND8toNZ4bN77U/RUsQr
 KUe6PvTYVx044jPw4zn5JMs21T0CC89yRDi+6d6UpCm5JWPSyJ0NO8+QoWe7u+idcEwPCe8RGI6
 5JCn5nfdilLVjIWGKI2LeNnc86Ip+DH8CZyWGL8cqaP+FBUqjB855I98cbHS9K9czfSni73Zk
X-Google-Smtp-Source: AGHT+IH2sRvC7+qOk1FM1Gff+Imzqrwb0HJW4m8b9iLovtQRzp8mZXkrV84eIOT/qIPQylXKyGoPVQ==
X-Received: by 2002:a17:907:74c:b0:ad8:9645:798c with SMTP id
 a640c23a62f3a-af8fda3f59cmr646276466b.51.1753936325089; 
 Wed, 30 Jul 2025 21:32:05 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a750253sm41860066b.86.2025.07.30.21.32.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 21:32:04 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6155e75a9acso662839a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 21:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhIt1DNpZhRo9e9FJzDWZziZ92oScRiUpBtmdbehDLxraYb5L1nvsOFqSHQsmOSF9ev3Py3Ui/Dqk=@lists.freedesktop.org
X-Received: by 2002:a05:6402:2355:b0:615:a3f9:7be5 with SMTP id
 4fb4d7f45d1cf-615a3f99733mr2566183a12.25.1753936323939; Wed, 30 Jul 2025
 21:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
In-Reply-To: <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 21:31:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgq9v6TWjO0QiG3OkvrUU1RL6wqsNHDjansGfEPn5HwCA@mail.gmail.com>
X-Gm-Features: Ac12FXzF8dSyFCi3xpDHC2zrTkYczwDagbLbkfhvdeVqtRqioJqvlewvWWBto04
Message-ID: <CAHk-=wgq9v6TWjO0QiG3OkvrUU1RL6wqsNHDjansGfEPn5HwCA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Wed, 30 Jul 2025 at 21:26, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The good news is that it's bisecting without any ambiguity. So nowhere
> near as painful as last merge window.

Right now it's in the range 1b556bcc3837..63b8c9fdfb7f.

A few more bisections and I'll have it down to a dozen or fewer commits.

          Linus
