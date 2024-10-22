Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B365F9AB4FB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 19:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A57210E1DB;
	Tue, 22 Oct 2024 17:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OVPKWAxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A3F10E1DB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 17:24:52 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6e5ef7527deso31632837b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729617891; x=1730222691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sap7+NfOWYfTW34mb/wmOM5teAkuDL1mr85EUNsA8J0=;
 b=OVPKWAxwOQnb8k5sjK06fXdog3prXcoAR9MiQ073gPVSDrdC2mSiLDhBRSHMP1eTMt
 piq+SE4JhSkaGRJ9rUNQhYZMznDCUF/0i6nzciTx9OixZIwNmNgmsvXnUCvO/G488KrB
 iyUSjq8BiRVHAmxsvyfGR0ZoYiyh1mhPBW1B6iegGpoQ+jhi0DxPUEg0jMaF0z2F9+rk
 Qakl9u5PhyR+1AjZ8sGVuIJmZnAnVD5l2mWMscQkA1pDXk26oR+G+rz3KKa5i/n5aGkZ
 PGx5kHrGDb9LTCF0CCcWtL4g+P3z8D5KCFIUFrgkeLrut2rB1EZzGKqE9kdWEv9QuBzb
 mvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729617891; x=1730222691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sap7+NfOWYfTW34mb/wmOM5teAkuDL1mr85EUNsA8J0=;
 b=KOxj6+uCUslBRobO4AZMaKCoTdl0W+oMkOXd0e2tvL/H4NLKnk5xGxS89AZuFuN+Nz
 3DMhCCOLhVnblLw/T52N0CFKLgli99HZzbXRP7BegMwTBGIM/zycYmAzYyeMqIcsxJ4L
 KW+YD6s7WAQYZ96aCJtCENijsoVHBG8MBv7LyQPKfBkcnn2bCk3zauju1u7SfSKCWKjB
 WNB2LYvm6bayvdT6k4HyuQY2j0M09pHvg2+PgFnIzzorDlhGx3NBBP3r7RT9n36jJZKX
 8+Nox6VPRCFg2CHn9JpuT2eO7ZhDOhUuiY3LeOtyXB3Cce4KqtVVC6ANx4S2dI+gsa09
 qcTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTywTfwNSgWPLhljjuFRQ+sY+a7xHMn+basRlTojozkmP6QLC0qv+lh5hpP+5n67YtbY2dPR62aYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhGdGIPAt9I8ngpx2fd4XGeEAexGmz9yi0ujEIZo8C8xPOoyvi
 7Qx7hR5ikgc24fFtSf9RIcgw/XmRvbBPywasxMhbeLcLUDXniQuHZRiw3+6x+v6XiwC9cohB8cs
 oMlVOLENTA/dYiwmo+xSZrKH+B40=
X-Google-Smtp-Source: AGHT+IEnujnh/bO34CUA1vqx/l8qOyNVwHqJXA15oXi/PevKi+2nXwfi+/snC6zklUQSyWiVhgRqss8U/d/aORznvE0=
X-Received: by 2002:a05:690c:360c:b0:6db:d7c9:c97b with SMTP id
 00721157ae682-6e7d82d4463mr37816737b3.40.1729617891094; Tue, 22 Oct 2024
 10:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241022161825.228278-1-olvaffe@gmail.com>
 <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
In-Reply-To: <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 22 Oct 2024 10:24:40 -0700
Message-ID: <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: boris.brezillon@collabora.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chunming Zhou <david1.zhou@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 faith.ekstrand@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 22, 2024 at 9:53=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.10.24 um 18:18 schrieb Chia-I Wu:
> > Userspace might poll a syncobj with the query ioctl.  Call
> > dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
> > true in finite time.
>
> Wait a second, just querying the fence status is absolutely not
> guaranteed to return true in finite time. That is well documented on the
> dma_fence() object.
>
> When you want to poll on signaling from userspace you really need to
> call poll or the wait IOCTL with a zero timeout. That will also return
> immediately but should enable signaling while doing that.
>
> So just querying the status should absolutely *not* enable signaling.
> That's an intentional separation.
I think it depends on what semantics DRM_IOCTL_SYNCOBJ_QUERY should have.

If DRM_IOCTL_SYNCOBJ_QUERY is mainly for vulkan timeline semaphores,
it is a bit heavy if userspace has to do a
DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT before a query.


>
> Regards,
> Christian.
>
> >
> > Fixes: 27b575a9aa2f ("drm/syncobj: add timeline payload query ioctl v6"=
)
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >
> > ---
> >
> > v2: add Signed-off-by and Fixes tags
> > ---
> >   drivers/gpu/drm/drm_syncobj.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 4fcfc0b9b386c..58c5593c897a2 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -1689,6 +1689,9 @@ int drm_syncobj_query_ioctl(struct drm_device *de=
v, void *data,
> >                           DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
> >                               point =3D fence->seqno;
> >                       } else {
> > +                             /* ensure forward progress */
> > +                             dma_fence_enable_sw_signaling(fence);
> > +
> >                               dma_fence_chain_for_each(iter, fence) {
> >                                       if (iter->context !=3D fence->con=
text) {
> >                                               dma_fence_put(iter);
>
