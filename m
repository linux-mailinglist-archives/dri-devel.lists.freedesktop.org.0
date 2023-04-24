Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D493A6ED6AF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 23:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1FA10E1EF;
	Mon, 24 Apr 2023 21:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3209310E1EF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 21:19:06 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-b990eb5dc6bso6388083276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682371145; x=1684963145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ELNYGHZIHKIFqJnEo8rrxCvQcGZL8aQd25lTdSNpTU=;
 b=WI1XsKYMpgoFidFg4IhkX3e7yhAD7vjHTBtPnW2dFXLaRH0nNpnghSEw5/otikrx8T
 hmY0Ty0T6EnnQ8G/InQB0UUTwbsnO0RnnwZwir5BMQtxj0wcIndwKMJGhJX5US5qQ89r
 DvI66B6LVvdHu7pKMbiuZfcbCfIUufQ1TjzxqQfB8ybEfByWvL1gzFqTQgF1uURlOAN6
 zFb5PkwiTJi4KLuiAOF6J6gfquGxErPE0y30MTrNcxS6hztoSqia14YX0zcn6HxroEvG
 KkdeoxqJP3m9y/KsOmLunn+brG+SGkhYrLClxoLb54KITdHIp/Bj/5A71br/IQcSXrmK
 5W7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682371145; x=1684963145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ELNYGHZIHKIFqJnEo8rrxCvQcGZL8aQd25lTdSNpTU=;
 b=Ovf70PN/8tw1WFzJ785QeeR25IHOd+Tuf0cIqN13tu63VOJgwyO77sCoRpnm5yie68
 cY6F+/JxId9pakrEOMI7QCbnHxUkhwEIB/AhlAA0kZ5LV5myykemMZr8q+BALgQzNIgQ
 CHZq0Y3eC4j1blZn4mObm6o6lVNG6vWze8vPAebMPRamluhfdxQVq8Eq7u78K+EbFdTS
 HZafkt2Bfl60FHPc8+U3BPaWUnWLa2mIu1gxr8yhoroWh+b4H2by8QuRXmh04Wfs6ux6
 URoDTd59qoUOT8OduX3sEKbUKk+f44dVqeLxNKGv5rWsHEbhKG+Mo3Ht/SyScZGhsJZ9
 rgAw==
X-Gm-Message-State: AAQBX9eO/ogho2qXJbn/FLyC7DTd5tih7kuEpS0nXGKhTVNtrkmOewIR
 iw4FNXq5TkqF4tHDLh10Pl2HHQYuKVku0iEGg5k=
X-Google-Smtp-Source: AKy350bIutNAx2s3uim7XhIGk4I/A1SpruAMfqxCi3BtHANN2gnfUfyRu2mDo2WKaDgILlZ4O/PjnkSdWyuqzRO1kL8=
X-Received: by 2002:a25:ccd6:0:b0:b95:72cf:8c80 with SMTP id
 l205-20020a25ccd6000000b00b9572cf8c80mr12196588ybf.51.1682371144597; Mon, 24
 Apr 2023 14:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
 <1681863018-28006-4-git-send-email-justinpopo6@gmail.com>
 <03dadae3-3a89-cdb0-7cd1-591d62735836@gmail.com>
 <932bb2c6-71ce-525f-fbb2-a0a742ee8e12@gmail.com>
In-Reply-To: <932bb2c6-71ce-525f-fbb2-a0a742ee8e12@gmail.com>
From: Justin Chen <justinpopo6@gmail.com>
Date: Mon, 24 Apr 2023 14:18:53 -0700
Message-ID: <CAJx26kXf0QOvOPRG+nPpJ2rfNcuX68oqejbzOG4awe6feTvMyg@mail.gmail.com>
Subject: Re: [PATCH net-next 3/6] net: bcmasp: Add support for ASP2.0 Ethernet
 controller
To: Florian Fainelli <f.fainelli@gmail.com>
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
Cc: devicetree@vger.kernel.org, pabeni@redhat.com, opendmb@gmail.com,
 andrew@lunn.ch, linux@armlinux.org.uk, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, justin.chen@broadcom.com,
 linaro-mm-sig@lists.linaro.org, edumazet@google.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, krzysztof.kozlowski+dt@linaro.org,
 kuba@kernel.org, christian.koenig@amd.com,
 Heiner Kallweit <hkallweit1@gmail.com>, sumit.semwal@linaro.org,
 davem@davemloft.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 9:33=E2=80=AFAM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
> On 4/18/23 23:35, Heiner Kallweit wrote:
> > On 19.04.2023 02:10, Justin Chen wrote:
> >> Add support for the Broadcom ASP 2.0 Ethernet controller which is firs=
t
> >> introduced with 72165. This controller features two distinct Ethernet
> >> ports that can be independently operated.
> >>
> >> This patch supports:
> [snip]
> >> +    intf->tx_spb_index =3D spb_index;
> >> +    intf->tx_spb_dma_valid =3D valid;
> >> +    bcmasp_intf_tx_write(intf, intf->tx_spb_dma_valid);
> >> +
> >> +    if (tx_spb_ring_full(intf, MAX_SKB_FRAGS + 1))
> >> +            netif_stop_queue(dev);
> >> +
> >
> > Here it may be better to use the new macros from include/net/netdev_que=
ues.h.
> > It seems your code (together with the related part in tx_poll) doesn't =
consider
> > the queue restart case.
> > In addition you should check whether using READ_ONCE()/WRITE_ONCE() is =
needed,
> > e.g. in ring_full().
>
> Thanks Heiner. Can you trim the parts you are not quoting otherwise one
> has to scroll all the way down to where you responded. Thanks!
> --
> Florian
>

Hello Heiner,

The implementation is a locked single queue xmit. Not sure how
netdev_queues.h fits into the picture here. I believe I am handling
the queue restart here.
+static int bcmasp_tx_poll(struct napi_struct *napi, int budget)
+{
[snip]
+ if (released)
+ netif_wake_queue(intf->ndev);
+
+ return 0;
+}
Let me know if I am misunderstanding the feedback here.

Thanks,
Justin
