Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C792B243E77
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 19:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC486E0B8;
	Thu, 13 Aug 2020 17:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4EC6E0B8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:45:35 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f357bd20001>; Thu, 13 Aug 2020 10:43:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 13 Aug 2020 10:45:34 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 13 Aug 2020 10:45:34 -0700
Received: from [172.20.40.59] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 17:45:33 +0000
Subject: Re: [git pull] drm for 5.8-rc1
To: Karol Herbst <kherbst@redhat.com>
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
From: James Jones <jajones@nvidia.com>
Message-ID: <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
Date: Thu, 13 Aug 2020 10:45:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597340626; bh=DC16JkqXELXCOechc02qz0RDqZUJ9TvHhnXZALY5UuE=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=RlQjTqnTEA4k0kbUvgPf7cC0zrMIVRgS0PqUx7E//oLgt8QDXkEXQqeoY25OfUv6G
 /pGjOvqLHILRJmZgo4xSRLBr95Umue5bg2fam0+6JkIqNhgRpdvlfZsey4Gat86TRk
 IyFkjGh/M1maqymkX6vgv1WafKg08Kikws0l3kgPblgmaE7MtIHszeFQJ7bHFCnBqw
 13PW/GRcdPxBArztgGlYFng2r+2G+L0FB/uuIpZ1IbRjp/WUorXJ2MRU422+lGjWgU
 mCnfs3wVRYj3gL/t2nhbg0kzvHJiXv+brURrcg0k45CSlcDufXLX5ax5WDQFwVl16c
 0uPm+3dM5PwBQ==
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'll defer to Thierry, but I think that may be by design.  Tegra format 
modifiers were added to get things like this working in the first place, 
right?  It's not a regression, is it?

Thanks,
-James

On 8/13/20 10:19 AM, Karol Herbst wrote:
> another thing: with gsettings set org.gnome.mutter
> experimental-features '["kms-modifiers"]' it all just works out of the
> box with wayland, but that won't be enabled for quite some time, so we
> need to figure out what is broken (less so with my patch) under
> wayland with gnome :)
> 
> On Thu, Aug 13, 2020 at 5:39 PM Karol Herbst <kherbst@redhat.com> wrote:
>>
>> btw, I just noticed that wayland with gnome-shell is totally busted.
>> With this MR it at least displays something, but without it doesn't
>> work at all.
>>
>> On Thu, Aug 13, 2020 at 3:00 PM Karol Herbst <kherbst@redhat.com> wrote:
>>>
>>> At least for now I've created an MR to revert the change:
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6300
>>>
>>> But it seems like there was probably a good reason why it got added?
>>> Happy to have better fixes, but that's the best we've got so far I
>>> think?
>>>
>>> Thierry, what do you think?
>>>
>>> On Wed, Aug 12, 2020 at 8:51 PM Karol Herbst <kherbst@redhat.com> wrote:
>>>>
>>>> in case you all were wondering, it works on xorg-server git because of
>>>> this commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/9b8999411033c9473cd68e92e4690a91aecf5b95
>>>>
>>>> On Wed, Aug 12, 2020 at 8:25 PM James Jones <jajones@nvidia.com> wrote:
>>>>>
>>>>> On 8/12/20 10:40 AM, Alyssa Rosenzweig wrote:
>>>>>>> ...and in merging my code with Alyssa's new panfrost format modifier
>>>>>>> support, I see panfrost does the opposite of this and treats a format
>>>>>>> modifier list of only INVALID as "don't care".  I modeled the new nouveau
>>>>>>> behavior on the Iris driver.  Now I'm not sure which is correct :-(
>>>>>>
>>>>>> ....and neither am I. Uh-oh.
>>>>>>
>>>>>> I modeled the panfrost code after v3d_resource_create_with_modifiers,
>>>>>> which treats INVALID as "don't care". I can confirm the panfrost code
>>>>>> works (in the sense that it's functional on the machines I've tested),
>>>>>> but I don't know if it is actually correct. I think it is, since
>>>>>> otherwise you end up using linear in places it's unnecessary, but I'm
>>>>>> not sure where this is spec'd.
>>>>>
>>>>> It would depend on whether an app actually calls the function this way,
>>>>> and whether that app was tested I suppose.  If I'm interpreting the Iris
>>>>> code correctly and it doesn't break anything, then I'm assuming both
>>>>> implementations are equally valid in that nothing exercises this path,
>>>>> but it would be good to have the intended behavior documented somewhere
>>>>> so we can try to work towards consistent in case someone tries it in the
>>>>> future.
>>>>>
>>>>> My nouveau change runs afoul of assumptions in the tegra driver, but
>>>>> that's easy enough to fix in lockstep if desired.
>>>>>
>>>>> Also, heads up: I'll ping you on my format modifier cleanup MR once I've
>>>>> pushed the latest version.  The panfrost modifier usage was harder to
>>>>> merge into the refactoring than most, so it'll be good to have your
>>>>> review and if you have time, some testing.  I think I landed on an
>>>>> elegant solution, but open to suggestions.
>>>>>
>>>>> Thanks,
>>>>> -James
>>>>>
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
