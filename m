Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B96917E50
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 12:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AE610E833;
	Wed, 26 Jun 2024 10:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="lYfTnYXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A34110E270
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:39:15 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-79c072af217so128082285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1719398354; x=1720003154;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0WHKZbvNuX92u84qLcbUXpAEPMgHXpjkUAo84IV0s/o=;
 b=lYfTnYXUD6j+Ahke00KqeJe/btq7xyuUaD4nLGR5/Vt/9E5XnzLh5VYhl5wwRni53B
 D1ljqMtSNsHJEQapDiiuf8P+kl4gGLoVE3jNIEtVlECXKxyPJdt4+YxuQCEljTRFTm8Q
 1tVPjiZKzlbBR0FRzkChFQGXk+w85SFVBzxGno3h20YJNiI7Zr7pgvrAAU90BtlS8iCm
 q7engeXnVnBvETNrfROS+VTlnk7cedfiogB17jKulRLob2we04O6pwVq+VicY7tVKa7K
 A0N5v5vJIrx4/pProcfM+UXfl2D2h46qHSCIm73l/QOtvinWb8dZJMuTM98mDDQUzR/U
 d9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719398354; x=1720003154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WHKZbvNuX92u84qLcbUXpAEPMgHXpjkUAo84IV0s/o=;
 b=S28eDUrqGG6OIifElV/rU5zZ0vqqaJPJIrZAcvcyrndCyJRvYU+kkoITjiZmwCdKqi
 n1Riqe5OL4ThxXs00EbGrPjzL+9In+fVfWCQO+8dHhE4M6ePi+fBaaC7LoHHSBlqvTYJ
 Ese9zGJVE+r5KF2n9vx4PAbM/I4E42ev5Q/6MO9j3W2ZL1ofzNgxMEFS5w97vOXMEZig
 j8WoQ4KWpa6e9WqaeeK+hdfz+GCRZRIQRkdYEL/s3x+JrjyFtrkCKgMS6cXlQS2ohl59
 tTVCjB1z3SB7e67VlP/ts/wVrbv9+d5TU0F+6Fr5RJ/D7iyFMCbKXZlWArEbu6FLpOR7
 /b4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV3eXa2QSrAS4+zjPksp9GScdR8M+gbegN08rbtPYHxPxaY09EYbQkv4/q+WwdG2B93e0sewlaukynOmCJJMinNzYFbVQ5zwa8PUtdZG3i
X-Gm-Message-State: AOJu0YwpA3x5g7s6iBZRJYW9Z/+e2jyRRhiAbncxxjAxDzI9sD5MUTBZ
 /cD4UwQBqNCmFXnmFCP+2HLApeyE5qO+qbV3feuD73PWBRG+N4LEHRfGnufza4ayRCraPG+Oxak
 v8pBfVHKdnAuklO92MRYxpCLvv6/DHWWn5N3kzQ==
X-Google-Smtp-Source: AGHT+IEJ812eF8zWIpx152aNazf7TkH1mzWCEt7UM4JhxnxcwMH6yI68IWE7/8fYUJAfdVLiQBlSAhQNkYlNULRX6aI=
X-Received: by 2002:a05:622a:49:b0:440:f54d:1bac with SMTP id
 d75a77b69052e-444d91a819dmr125069131cf.16.1719398353655; Wed, 26 Jun 2024
 03:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
 <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
 <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
 <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
In-Reply-To: <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Jun 2024 11:39:01 +0100
Message-ID: <CAPj87rPB=N2vJ-5C7xXORYstK3=TpX+jZ7mCr7oxY2wpXeaTTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 linux-kernel@vger.kernel.org, 
 Oded Gabbay <ogabbay@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
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

On Wed, 26 Jun 2024 at 09:28, Lucas Stach <l.stach@pengutronix.de> wrote:
> Mesa doesn't cope right now. Mostly because of the renderonly thing
> where we magically need to match render devices to otherwise render
> incapable KMS devices. The way this matching works is that the
> renderonly code tries to open a screen on a rendernode and if that
> succeeds we treat it as the matching render device.
>
> The core of the issue is that we have no way of specifying which kind
> of screen we need at that point, i.e. if the screen should have 3D
> render capabilities or if compute-only or even NN-accel-only would be
> okay. So we can't fail screen creation if there is no 3D engine, as
> this would break the teflon case, which needs a screen for the NN
> accel, but once we successfully create a screen reanderonly might treat
> the thing as a rendering device.
> So we are kind of stuck here between breaking one or the other use-
> case. I'm leaning heavily into the direction of just fixing Mesa, so we
> can specify the type of screen we need at creation time to avoid the
> renderonly issue, porting this change as far back as reasonably
> possible and file old userspace into shit-happens.

Yeah, honestly this sounds like the best solution to me too.

Cheers,
Daniel
