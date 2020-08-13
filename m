Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B456243E7C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 19:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB31E6EA7E;
	Thu, 13 Aug 2020 17:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959346EA7E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597340937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CgpjmN45HSegualDRzVH4Q9X/JRMomQMgJpQvIyd7vs=;
 b=E6xEi2RkNb3jnG5aKu04k2IoYqbp8O79Ytl15Lih7vQc3RxuDBFXuu08A5AKwQDTRodumn
 3AyrEU+FJTVLtH2AWeHpurLPhzSpIn4Ijfa7UoIFFu1uFBu+8n9JbSs6tcwgqML9ORMNlJ
 4E4txIK+FXCYMLCIAHUxGSr2JHTssjk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-qKS6g97sPIyTF7cH1v1nZA-1; Thu, 13 Aug 2020 13:48:53 -0400
X-MC-Unique: qKS6g97sPIyTF7cH1v1nZA-1
Received: by mail-qt1-f198.google.com with SMTP id z5so5473836qtc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 10:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CgpjmN45HSegualDRzVH4Q9X/JRMomQMgJpQvIyd7vs=;
 b=TfyixwJV2DnmdSAC1Kl5NVkhpFwc0PMHP8GJr1RRl7id1Gy/Q/3HpqCl/T7aEjDx0u
 QvVtDQA0VcQHTdXcQTZdSUpbhqLP96CTBCv04hUrWZ+0fpuZ1n+msEv0Y1sox13LJyjs
 EYQxf6pFfpERyyPh/Odz6xrLNIfq6P2/mtpDuOdyDNQ+FA5Z2nn0GGQjPD8auBUNkUpQ
 e0nbc8nuYK3PMtU3lC2t1kQjjrQbZHOAM3p8GUi2UGW4/brzYN1eW0RwW71zUoheom5B
 XTg0CZDPBMydBugZ8w4dqEV7g42mGWMv8gD+SkpT7aV6+0Aprol37X28sqce73lxPCAI
 Gm/w==
X-Gm-Message-State: AOAM531JNkShQFu0LqlVbdRiOCBZrqbjiStfovUH8rHYY+By/iE93vcd
 SAbMzJyvRZ7MG2G7n83i5D71YE9zWUJXRdmjLMCyjG1WmlepS66rHYAamWzLDkQvCSnbCMgzz5+
 vxlO+1TmofgPNrjtcBvhC70bNqNMtMek4CpTkhgdEmDXj
X-Received: by 2002:ad4:438f:: with SMTP id s15mr6004728qvr.164.1597340931138; 
 Thu, 13 Aug 2020 10:48:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDhD70kLGpdJ5y1/Fs/wnH+nkNxqoONHYi2HksRjIpoTrwK9hUKhKMWye7gJvokXs7ENV89ubrDXXJNUXJEiU=
X-Received: by 2002:ad4:438f:: with SMTP id s15mr6004703qvr.164.1597340930863; 
 Thu, 13 Aug 2020 10:48:50 -0700 (PDT)
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
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
In-Reply-To: <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Aug 2020 19:48:39 +0200
Message-ID: <CACO55tsZAh4aThBSqiQJ5o6jCi+6vcfXDEfCueyBmOK62ZsW5Q@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 7:45 PM James Jones <jajones@nvidia.com> wrote:
>
> I'll defer to Thierry, but I think that may be by design.  Tegra format
> modifiers were added to get things like this working in the first place,
> right?  It's not a regression, is it?
>

That would be slightly annoying as this would mean by design it's
broken by default :/ Also, we have no Xorg release supporting
modifiers anyway and it does seem to work with X 1.20.8 (which doesn't
enable modifier support). And I talked with Jonas (working on mutter)
about it and there were no plans to turn on modifier support by
default at this point.

> Thanks,
> -James
>
> On 8/13/20 10:19 AM, Karol Herbst wrote:
> > another thing: with gsettings set org.gnome.mutter
> > experimental-features '["kms-modifiers"]' it all just works out of the
> > box with wayland, but that won't be enabled for quite some time, so we
> > need to figure out what is broken (less so with my patch) under
> > wayland with gnome :)
> >
> > On Thu, Aug 13, 2020 at 5:39 PM Karol Herbst <kherbst@redhat.com> wrote:
> >>
> >> btw, I just noticed that wayland with gnome-shell is totally busted.
> >> With this MR it at least displays something, but without it doesn't
> >> work at all.
> >>
> >> On Thu, Aug 13, 2020 at 3:00 PM Karol Herbst <kherbst@redhat.com> wrote:
> >>>
> >>> At least for now I've created an MR to revert the change:
> >>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6300
> >>>
> >>> But it seems like there was probably a good reason why it got added?
> >>> Happy to have better fixes, but that's the best we've got so far I
> >>> think?
> >>>
> >>> Thierry, what do you think?
> >>>
> >>> On Wed, Aug 12, 2020 at 8:51 PM Karol Herbst <kherbst@redhat.com> wrote:
> >>>>
> >>>> in case you all were wondering, it works on xorg-server git because of
> >>>> this commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/9b8999411033c9473cd68e92e4690a91aecf5b95
> >>>>
> >>>> On Wed, Aug 12, 2020 at 8:25 PM James Jones <jajones@nvidia.com> wrote:
> >>>>>
> >>>>> On 8/12/20 10:40 AM, Alyssa Rosenzweig wrote:
> >>>>>>> ...and in merging my code with Alyssa's new panfrost format modifier
> >>>>>>> support, I see panfrost does the opposite of this and treats a format
> >>>>>>> modifier list of only INVALID as "don't care".  I modeled the new nouveau
> >>>>>>> behavior on the Iris driver.  Now I'm not sure which is correct :-(
> >>>>>>
> >>>>>> ....and neither am I. Uh-oh.
> >>>>>>
> >>>>>> I modeled the panfrost code after v3d_resource_create_with_modifiers,
> >>>>>> which treats INVALID as "don't care". I can confirm the panfrost code
> >>>>>> works (in the sense that it's functional on the machines I've tested),
> >>>>>> but I don't know if it is actually correct. I think it is, since
> >>>>>> otherwise you end up using linear in places it's unnecessary, but I'm
> >>>>>> not sure where this is spec'd.
> >>>>>
> >>>>> It would depend on whether an app actually calls the function this way,
> >>>>> and whether that app was tested I suppose.  If I'm interpreting the Iris
> >>>>> code correctly and it doesn't break anything, then I'm assuming both
> >>>>> implementations are equally valid in that nothing exercises this path,
> >>>>> but it would be good to have the intended behavior documented somewhere
> >>>>> so we can try to work towards consistent in case someone tries it in the
> >>>>> future.
> >>>>>
> >>>>> My nouveau change runs afoul of assumptions in the tegra driver, but
> >>>>> that's easy enough to fix in lockstep if desired.
> >>>>>
> >>>>> Also, heads up: I'll ping you on my format modifier cleanup MR once I've
> >>>>> pushed the latest version.  The panfrost modifier usage was harder to
> >>>>> merge into the refactoring than most, so it'll be good to have your
> >>>>> review and if you have time, some testing.  I think I landed on an
> >>>>> elegant solution, but open to suggestions.
> >>>>>
> >>>>> Thanks,
> >>>>> -James
> >>>>>
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
