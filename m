Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866BED13B4E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D2110E18F;
	Mon, 12 Jan 2026 15:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="QQGCa9m+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB4710E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 15:35:05 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-88a26ce6619so68806586d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768232104; x=1768836904; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YhowijaztWf/3gTanh1QGKmo9pcuIvisiulcfP4DQN8=;
 b=QQGCa9m+VT1mSxHn+voIgzn4FqRIJLOYsfS9CrItKXXKtCDPdSn3wxe+2ZM0LccVEH
 v5bYAIpJ0O5r7UBsvqtoQOZyPmqR5Qr804mru7QpVml2gz3h5n0INZFQbErmTUhKb0nc
 FgwhpEtBa1a8JQVrTa42aajhLdVZeHM5K6Ht9BlpoashoPHkB/q55oYefN/UV2lGwQ7F
 0Mo7iBKCa2peEu07+9xI68YvuUWfutEbQjizw2zs76IR9n1xIr1eOI4THU3oH5j4WH4T
 P2IkwfhQrvissxdk/tzxPMv8Nd5xmrCTCjmabn3a+0EG98sOLbQTALquVMxt+u6Qy+JH
 BYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768232104; x=1768836904;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhowijaztWf/3gTanh1QGKmo9pcuIvisiulcfP4DQN8=;
 b=CSYCKFWz6KPAN88Kw9ULiKJ+pemBjoKDsbjM+sXwhelKyksQCsBuptx0w2sC0ILEdL
 wepmjHqd3xky8XM1Eqs6lQzWP7h1Lm5aTPOe/P9czjZnA3Hf9Nf7/wyr5+zEO9gSs5/x
 4E0kHOiQS6L3XIvTjNIPtmw5W8+dOm1biRncsWLRs/FBuXV4ERAYCmqyNngxxik4fpO3
 2xG2QCnPcJJN7ogBXVpmz2mS307Df+S+uXMWkhsH1F57WGy1YB3FNAIrq8UjqtbTyrd4
 NMw+N9z4219V6i3tSZKWfhpnTLiAlRDmIFbWh9VEPRhn0mzds1TGXkpoGOZtJx2m2+k0
 AL6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU16EyRR95FQ2lKmuNhNmNU6lA9yaA8Mq0iwrhx+FROSC/nlnZdRiCoQXzXmQ1p2eWuE4D3M6axoHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH+9WEKMpf3CDtizgPwL3/CR1sKs3wHp7OknZAiKzuqEVR1gOj
 Vac7FlS4EkjIC1IBrXxkJg/Z0Av1Lyzo3LAZf6RVUAnrFqmdCUTSnnUBLt3Lf4i267o=
X-Gm-Gg: AY/fxX6EkzBpKM6XXQWh3AGfOXUPKWpC2Se8QeuZrhoF76Rc6nDz439gGDHBByMR9uo
 9ozhapQb5CcwXvEVJoiCYukQ3QsTMPJVktGePD86Ij1BGl06qCOs/yP0uowjfmWhxO3VukVOZRj
 3eoH05W9ZXME+Zv70HooBh0Lg7VEedG0wRR3wg5SHDmVXUmTIQ5ZxQOX7pPoRkfkT66KTKHNbVJ
 aow7uVKls6evMMUE3LExbpb/a3TeKp1hGZrUIyOHq4guhuNOHanQAi57CDZzbERT+0j7qKj3OF2
 4Hn90O21l0Ci7nHWoY0K4b98Y3zJ1vd86yZ+ctqOqidYOBJs8cboi2eH0SCBZx+Zywz74da5ieJ
 j3HykdOOZM5nRqOAf9wfL3EQekqVvUwBJwAwISwJdnAsyjLA9c1OaHz+LVC1u+MVcuHyVC8E5OJ
 cUZt6KPBS1AoiSYY4rhdljxkLs/Kq32HD9TZX3i+tTwdAD+aXO4WzO8a8nninpGA1KnbU=
X-Google-Smtp-Source: AGHT+IHFUDshOX5YDXPelpZvfCAVTGi9FjIy10Hnlj/GEw1ZiF/o5tF46ZaUyCruFsiUwzfjzfL6tA==
X-Received: by 2002:a05:6214:458e:b0:888:6fa6:782b with SMTP id
 6a1803df08f44-890841d596amr270142346d6.30.1768232104214; 
 Mon, 12 Jan 2026 07:35:04 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89077280fd3sm137593066d6.55.2026.01.12.07.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 07:35:03 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vfJwd-00000003R6K-0Swy;
 Mon, 12 Jan 2026 11:35:03 -0400
Date: Mon, 12 Jan 2026 11:35:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alex Williamson <alex@shazbot.org>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared
 buffers
Message-ID: <20260112153503.GF745888@ziepe.ca>
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
 <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
 <20260112121956.GE14378@unreal>
 <2db90323-9ddc-4408-9074-b44d9178bc68@amd.com>
 <20260112141440.GE745888@ziepe.ca>
 <f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com>
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

On Mon, Jan 12, 2026 at 03:56:32PM +0100, Christian König wrote:
> > The problem revoke is designed to solve is that many importers have
> > hardware that can either be DMA'ing or failing. There is no fault
> > mechanims that can be used to implement the full "move around for no
> > reason" semantics that are implied by move_notify.
> 
> In this case just call dma_buf_pin(). We already support that
> approach for RDMA devices which can't do ODP.

That alone isn't good enough - the patch adding the non-ODP support
also contained this:

static void
ib_umem_dmabuf_unsupported_move_notify(struct dma_buf_attachment *attach)
{
	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;

	ibdev_warn_ratelimited(umem_dmabuf->umem.ibdev,
			       "Invalidate callback should not be called when memory is pinned\n");
}

static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_ops = {
	.allow_peer2peer = true,
	.move_notify = ib_umem_dmabuf_unsupported_move_notify,
};

So we can't just allow it to attach to exporters that are going to
start calling move_notify while pinned.

Looking around I don't see anyone else doing something like this, and
reading your remarks I think EFA guys got it wrong. So I'm wondering
if this should not have been allowed. Unfortunately 5 years later I'm
pretty sure it is being used in places where we don't have HW support
to invalidate at all, and it is now well established uAPI that we
can't just break.

Which is why we are coming to negotiation because at least the above
isn't going to work if move_notify is called for revoke reasons, and
we'd like to block attaching exporters that need revoke for the above.

So, would you be happier with this if we documented that move_notify
can be called for pinned importers for revoke purposes and figure out
something to mark the above as special so exporters can fail pin if
they are going to call move_notify?

Then this series would transform into documentation, making VFIO
accept pin and continue to call move_notify as it does right now, and
some logic to reject the RDMA non-ODP importer.

Jason
