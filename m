Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B0162FE03
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 20:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F80110E7A3;
	Fri, 18 Nov 2022 19:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ADB10E7A4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 19:31:58 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id n205so6431426oib.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 11:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4aUMnezBjeTl1jsDQJ0t2bffjzqiY8JJHUDYwCqwLA=;
 b=jM3AmfCW/2nHZxFgGS9Heu3pQvdP14z1y35P4H80L5GvxTjhGcP7LFZgivC4gaY60w
 nN+fDhHzgWT+2NAIbiSfL6Rns9ljZnWLIlo99CYzOUugLbs2wTkpPqm/GQQc12jBVjZR
 4+9kRbCPA2VzSdqbnS9ygKwPs6bsFRbks995B1w1BCOjrw1RMcFhLHExZZx4o2k8qTgr
 TjmsbBTlyhwqdXMkFnzdwd9h1r6hFKN8kO0kSFSZO9Ik7Hz28tqbGqJDGyBpyOfRyIOb
 v1S32k4HE0ADNTZ2XWf1Pm3h52Ya5QeOaA51YlzhXUK1zboM4QvbwyM5ahK1hNR7nmS+
 qEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4aUMnezBjeTl1jsDQJ0t2bffjzqiY8JJHUDYwCqwLA=;
 b=MmbjqPQ3GtHrlraZ0G4oQjsVoQE4s7mO0dySgua76NESOisNbmXOSvIfAafQx4Fi5B
 9s+UFJewzG7EAI9m22+S/7DQcmQcqeZ+pR7xz79wJqVdNW94n25usYtag6ZgNm+pmmD7
 y2ju31aQs6hcCZbskXnfbinRw/ZIgZK2R9Es9k3bR5OzUvmySSgwnXd4nUni46W+tmdx
 3LOoiVMq0oHioEdQpShz9jZpbVViQswjq0gB3MrvsGOxEPeyd4SaHl8H4+LfNWg+ULM5
 YQfLBV5FmzXYBC7pBZhY5HZMny7MLfdMJA3nYXkafHzMECqCyHhmEChi6OcjEWUs6L7Q
 uwnA==
X-Gm-Message-State: ANoB5plpkEk2IqUhcJ4AenSryjX7ck5hkxUGLLTFM/KUtUsy8KJBn7Vt
 NTfFJno6dH4PTj4i17lrijaL9ab7WSCtvQPbr/k=
X-Google-Smtp-Source: AA0mqf7f2OW5VJGSiFWIbV1iX15MWwqhFk2z0a4peRT5QDLGMcj5gnnNu7gdRSqtSDb5fD6MgxHrYtioX+SoXulEiT4=
X-Received: by 2002:a05:6808:2086:b0:354:46fc:9bb3 with SMTP id
 s6-20020a056808208600b0035446fc9bb3mr4221461oiw.38.1668799918044; Fri, 18 Nov
 2022 11:31:58 -0800 (PST)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
In-Reply-To: <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Nov 2022 11:32:19 -0800
Message-ID: <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To: Nicolas Dufresne <nicolas@ndufresne.ca>
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
Cc: linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 7:38 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le jeudi 17 novembre 2022 =C3=A0 13:10 +0100, Christian K=C3=B6nig a =C3=
=A9crit :
> > > > DMA-Buf let's the exporter setup the DMA addresses the importer use=
s to
> > > > be able to directly decided where a certain operation should go. E.=
g. we
> > > > have cases where for example a P2P write doesn't even go to memory,=
 but
> > > > rather a doorbell BAR to trigger another operation. Throwing in CPU
> > > > round trips for explicit ownership transfer completely breaks that
> > > > concept.
> > > It sounds like we should have a dma_dev_is_coherent_with_dev() which
> > > accepts two (or an array?) of devices and tells the caller whether th=
e
> > > devices need explicit ownership transfer.
> >
> > No, exactly that's the concept I'm pushing back on very hard here.
> >
> > In other words explicit ownership transfer is not something we would
> > want as requirement in the framework, cause otherwise we break tons of
> > use cases which require concurrent access to the underlying buffer.
>
> I'm not pushing for this solution, but really felt the need to correct yo=
u here.
> I have quite some experience with ownership transfer mechanism, as this i=
s how
> GStreamer framework works since 2000. Concurrent access is a really commo=
n use
> cases and it is quite well defined in that context. The bracketing system=
 (in
> this case called map() unmap(), with flag stating the usage intention lik=
e reads
> and write) is combined the the refcount. The basic rules are simple:

This is all CPU oriented, I think Christian is talking about the case
where ownership transfer happens without CPU involvement, such as via
GPU waiting on a fence

BR,
-R
