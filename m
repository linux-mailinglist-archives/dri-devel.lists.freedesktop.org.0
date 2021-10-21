Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64059436832
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 18:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E226E43B;
	Thu, 21 Oct 2021 16:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AD06E43B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 16:42:13 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w19so1761795edd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kDRmnzIH03xrtrZgYDtwH/WzS6dnydlo7OWL37wWGU=;
 b=c0pPEzMM+ASHHHj4QCNroPy2CARe+mLhA2STa+pRVgVttv/jnFta1ziqiI61pCgTeD
 q+IZuwqAnYPzTOTNsVi9nyYe1nN7QKSnBa9bpkd6gcYirMZcQmKBYBBIEAx8p5W9+kwf
 z8fjQ9n2pAQkUTpdpeyz2cVzajCbziKix765QEDWFkBlnDMa2mUjtkRvH4bkx/tU9yWQ
 9gCX4XKZJoY+6DahPdAbe41RwLqf8sLRW3+H6WY99ygDr0IYYCfS1kBfU4cQWAm/YX9m
 3l0AnUJRPowmGxJWoALREX+POwQiMWzswUWsudnHWklUDxsPo/jF49xJOA8hIb866LIC
 I0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kDRmnzIH03xrtrZgYDtwH/WzS6dnydlo7OWL37wWGU=;
 b=04HnGLhxpsFmYKEtj7qfqQ957CGuFFi7BKwL6PJfk6qb6JKb0FZXi4ydfMvjC6kwQR
 DG0tDMk8efaaRFlnL3iXVAoSvz06LPUkieNqaM1HGipDu1Ld9lSoE+bIhdpMTo7JduAu
 vi2Pr7MBIg+X8MAPpH4dU0TzAX35l0wUo1JAo/ToYOj7m44EQ5TLjUPVbNVGX9hetP8c
 WB7Nk7EQNYatRofE3TWQAFF0KcdoGlz7NeBrFcT+ktD1auK4KWCr+r1HGnGKibGvBPIF
 FpiX0exVCpoQjUAkz7UPt+XnFWP7CNXhuJZ5x5PDRUyRi4IfSDncUkAjXYJGWJCkZf5g
 RKrg==
X-Gm-Message-State: AOAM533twvm9EJUou+Rv+o+UR6auD9bU9j/3Qtt2NwLfhmplpxbwuR1e
 EW4Dz6APSVWl3b8RJiviCpobPzGOFuVAkOWR+fM=
X-Google-Smtp-Source: ABdhPJyccymnZsJh0cBou34794Zed2lq7y9b5xrz0vlxEDmBG54OEPx1zAnudKX4kA+2F1rEFB3yNELsy5w3piWj6SM=
X-Received: by 2002:a17:907:971e:: with SMTP id
 jg30mr8348703ejc.375.1634834532298; 
 Thu, 21 Oct 2021 09:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
 <20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org>
 <327a5c8a-d82d-f115-27bb-37125affe24b@collabora.co.uk>
 <20211021115212.dk2kl2vbl6qotjwa@sirius.home.kraxel.org>
In-Reply-To: <20211021115212.dk2kl2vbl6qotjwa@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 21 Oct 2021 09:42:00 -0700
Message-ID: <CAPaKu7TfEtikdg2HEt2_PH7=zPbk=d9wfosDjNmr1AU6CC6sMw@mail.gmail.com>
Subject: Re: drm/virtio: not pin pages on demand
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Maksym Wezdecki <maksym.wezdecki@collabora.co.uk>, 
 Maksym Wezdecki <maksym.wezdecki@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
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

On Thu, Oct 21, 2021 at 4:52 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Oct 21, 2021 at 11:55:47AM +0200, Maksym Wezdecki wrote:
> > I get your point. However, we need to make resource_create ioctl,
> > in order to create corresponding resource on the host.
>
> That used to be the case but isn't true any more with the new
> blob resources.  virglrenderer allows to create gpu objects
> via execbuffer.  Those gpu objects can be linked to a
> virtio-gpu resources, but it's optional.  In your case you
> would do that only for your staging buffer.  The other textures
> (which you fill with a host-side copy from the staging buffer)
> do not need a virtio-gpu resource in the first place.
That's however a breaking change to the virgl protocol.  All virgl
commands expect res ids rather than blob ids.

Using VIRTGPU_BLOB_MEM_HOST3D could in theory work.  But there are a
few occasions where virglrenderer expects there to be guest storage.
There are also readbacks that we need to support.  We might end up
using VIRTGPU_BLOB_MEM_HOST3D_GUEST, where pin-on-demand is still
desirable.

For this patch, I think the uapi change can be simplified.  It can be
a new param plus a new field in drm_virtgpu_execbuffer

  __u64 bo_flags; /* pointer to an array of size num_bo_handles, or NULL */

The other changes do not seem needed.

>
> take care,
>   Gerd
>
