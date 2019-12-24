Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382DD12A221
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FC06E5BB;
	Tue, 24 Dec 2019 14:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D87E6E09C;
 Tue, 24 Dec 2019 11:22:21 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id cy15so17717743edb.4;
 Tue, 24 Dec 2019 03:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N+JpIu3vYJU8a5Gq7Z5l9BFQkWLO3Nuw3pvsMvETS7c=;
 b=H2b2ofvx22QIFqPfWb/57Cgo4+6EYRM3UmWRLglTZC78WjixSKQRStrNRVkP41+J3i
 D9rt2R9ktslIGTdHcHmxVtFRgeRAodsryfwssz/uNBn9qP1aW+pFoeFzxj8r4J954YCj
 /9Bxje/ma4Hcq9VmUqFpcK3BtabstmdU11pb09O9By5MFwQUYXWRZ4hArq/sDJuE7e6d
 jdrO8GqEyfSdl6I/YpBFOU6Cr1beioNmDtweTzR+t8T59BJIq3R5aSjs+xiMhsdZpTOe
 vCcr70c7mVfdLY84kTlBITIgkg00wbxKAHZz9Ua63zF5lxS/qM7GVJYyklqRrp8PV5Bw
 RJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N+JpIu3vYJU8a5Gq7Z5l9BFQkWLO3Nuw3pvsMvETS7c=;
 b=X+6rCs7GvC/a2+tU96qd5rQCVldQR1APJW+RxCl8wlJuPB82g57SQxhCcOBkTL8FWU
 +5ok3hV+DWwcdYK43ttDRW4DaHqi1/RnOwQVsMmm8e0p8jYKdeqpOMkhh7yM7ZQX9CTT
 mTMTyxcF7i8GmqPjCiXxCyElli86Zo07/ye/44+0l8pgtnybWcGM91K9xqwt7UDjriYh
 sukBbbQogMzrxgEvjy3ca5cuX6igmD7NnNiRLJ3WhPRa71YXE64JFqNOrM6sxo9Qm3nz
 4KWVXyyPaYiNb9PouYEbAJmJ2a4fYl1CUmoigxmDaOBRkQFNQw/YY6csoLHRMxkdonLV
 Z0xw==
X-Gm-Message-State: APjAAAUZVQCOfe9ZncaUSk+8wDb0jrr6Qiis0MubZbtH8CHLoLP6HLtB
 KQjYHUN72+IH4bL918viKnkEX6R+yr2sejgt6L8=
X-Google-Smtp-Source: APXvYqwpjloweDhJk9K1WbRoanlfiA93jPFsGS8Fs+PosuYx6ygOY/COI9WSyi+Vw5n5/quxpcoKFqWqpEy093u1djo=
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr1784678edr.57.1577186540180; 
 Tue, 24 Dec 2019 03:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
 <CAKGbVbvj5zK9gVDQ3+0=xmF5pOUOSJzZ6jaGKHoCqwjYz+UiEQ@mail.gmail.com>
In-Reply-To: <CAKGbVbvj5zK9gVDQ3+0=xmF5pOUOSJzZ6jaGKHoCqwjYz+UiEQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Dec 2019 12:22:09 +0100
Message-ID: <CAFBinCD+k8O90ePuwSEnW1+oh-xJ9oUC5P2WrHgLLBb0RHj+=Q@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Qiang Yu <yuq825@gmail.com>
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: lima@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 3:51 AM Qiang Yu <yuq825@gmail.com> wrote:
[...]
> For the code, I think you may need some lock to protect the time records as
> there are two kernel threads gp/pp will try to mark GPU busy and several
> interrupts try to mark GPU idle.
good catch, thank you for this!
I assume the reason is that the panfrost GPUs are using a "unified"
architecture, while the ones supported by lima don't

I'll add locking so I don't run into trouble.


Thank you!
Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
