Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34F242EB4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 20:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7814889DC9;
	Wed, 12 Aug 2020 18:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4EF89DC7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597258301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OugzKAi6x6et7NMn2YzJxBvsuXRet+he78dzEXvVXpg=;
 b=g9yPtKjb10FNhBf4jsrQIwFZZVZtd3J9hGSHSacEDMwGBsua8TeIozuNsnVuUj0aM9l0ng
 XsRKshbHb0W5Yntsnx2Y1/5/8SjA/uiyIXzUq9EKMsyPo2v2Rkn7NXe2/Ubu7vAZ1+rI5u
 q0EsjDeD3WCSfG+3dDqRhhfDZ+FPsNY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-NJ1dwBNnOj2YpM3gXAIdJQ-1; Wed, 12 Aug 2020 14:51:33 -0400
X-MC-Unique: NJ1dwBNnOj2YpM3gXAIdJQ-1
Received: by mail-qv1-f70.google.com with SMTP id v5so2160498qvr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 11:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OugzKAi6x6et7NMn2YzJxBvsuXRet+he78dzEXvVXpg=;
 b=Qi1MCzdMRyBEEoe3ns2J3DBXoDjKVNDSXpO9VptGWTurxT2hZ/KQRc7KSOcMuShsl9
 GYiDIyMA/VCKsy2B0nncRWefLdJ+uUOcL4X5ZAcBJZkP0kqudd9hOpvm/ahbMGHo4XuH
 SIwjF/bf+MJ13cZPMiwVxHCQvDbsKzJ7rZoLJl/UUH1Gyn6ccoT8qHx68VQTVqc0aUeq
 JmONf6Zu7xTKQkofTtqlDCsT/KDvSB+RL+dM+c7yyFhkp0Rwv0am5oNOJaXqU6EvwKIg
 5WPKlgaYGJmPLK/AH5QEcIBXv/zbODDnpXLZlsKfDW7+P75KqcdNQtDtlPUuaOa89P74
 /LGw==
X-Gm-Message-State: AOAM533yRowmEKJENCG1s1lbyyqmVN7bvV3nBssVWatcqXFFSzXXRze6
 x6zW5lJ56u/I5RnBwBYayw4Yfn0OLXu0bOVToEFGyXwxx0XKv7gpatp8nZmHgzkIhrYu1nfBPfz
 mc31qp3La3xoBkbhY8h+wI6S1iLJZk1oMBhTu3zMJJZc/
X-Received: by 2002:aed:24f2:: with SMTP id u47mr1145856qtc.137.1597258292232; 
 Wed, 12 Aug 2020 11:51:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnB30K0GeYt7XZJCqaPQ8Fm/Uv5Ft3SZv0pw2gd4QTxz7uhUJ/YvrUz5pteHJcM87NLGI+c/2wyaLtf+7nK4A=
X-Received: by 2002:aed:24f2:: with SMTP id u47mr1145830qtc.137.1597258291983; 
 Wed, 12 Aug 2020 11:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
In-Reply-To: <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 12 Aug 2020 20:51:20 +0200
Message-ID: <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in case you all were wondering, it works on xorg-server git because of
this commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/9b8999411033c9473cd68e92e4690a91aecf5b95

On Wed, Aug 12, 2020 at 8:25 PM James Jones <jajones@nvidia.com> wrote:
>
> On 8/12/20 10:40 AM, Alyssa Rosenzweig wrote:
> >> ...and in merging my code with Alyssa's new panfrost format modifier
> >> support, I see panfrost does the opposite of this and treats a format
> >> modifier list of only INVALID as "don't care".  I modeled the new nouveau
> >> behavior on the Iris driver.  Now I'm not sure which is correct :-(
> >
> > ....and neither am I. Uh-oh.
> >
> > I modeled the panfrost code after v3d_resource_create_with_modifiers,
> > which treats INVALID as "don't care". I can confirm the panfrost code
> > works (in the sense that it's functional on the machines I've tested),
> > but I don't know if it is actually correct. I think it is, since
> > otherwise you end up using linear in places it's unnecessary, but I'm
> > not sure where this is spec'd.
>
> It would depend on whether an app actually calls the function this way,
> and whether that app was tested I suppose.  If I'm interpreting the Iris
> code correctly and it doesn't break anything, then I'm assuming both
> implementations are equally valid in that nothing exercises this path,
> but it would be good to have the intended behavior documented somewhere
> so we can try to work towards consistent in case someone tries it in the
> future.
>
> My nouveau change runs afoul of assumptions in the tegra driver, but
> that's easy enough to fix in lockstep if desired.
>
> Also, heads up: I'll ping you on my format modifier cleanup MR once I've
> pushed the latest version.  The panfrost modifier usage was harder to
> merge into the refactoring than most, so it'll be good to have your
> review and if you have time, some testing.  I think I landed on an
> elegant solution, but open to suggestions.
>
> Thanks,
> -James
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
