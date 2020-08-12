Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94531242E7B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 20:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C784C6E15D;
	Wed, 12 Aug 2020 18:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C326E930
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 18:25:00 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3433ee0002>; Wed, 12 Aug 2020 11:24:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 12 Aug 2020 11:24:59 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 12 Aug 2020 11:24:59 -0700
Received: from [172.20.40.57] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Aug
 2020 18:24:59 +0000
Subject: Re: [git pull] drm for 5.8-rc1
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
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
From: James Jones <jajones@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
Date: Wed, 12 Aug 2020 11:24:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812174005.GA1705@kevin>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597256686; bh=Dpde44i/8TpRNfWK7bpdbK09ZkOgjioP2M9oUl9dT5U=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ISYkLK8fOrWCjre2mlbhNdWsBBNMxsPcfKx76qmv6Zbokn/89wXOCF5EAmMHtJPZJ
 oB5aYTMsu2gDXuIdKhQNto29VBNAk66+j7deQ1C5IAMZRr1bsOtP+sET6T7JsfXX/R
 zyCCp1L6sRIPzteViuAeOVF25VaxvTcpi8fA9BHixxWkkTYbviQ0Ct+cx8MtEv/LhT
 LY5gd0OAgh+8uVW/3GTgapo85oPNeDG8/6Wg3OHTkxYakB/UY1CQrPD6rGNtb+MHoa
 oZEnSwOVbprQq4H/45k8dpiQAftdLm14nYDoi+LoTWVB6m8roSIQFkCNRQoUTestnR
 T4j6UsFqP86aw==
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
 Thierry Reding <treding@nvidia.com>, Karol Herbst <kherbst@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/12/20 10:40 AM, Alyssa Rosenzweig wrote:
>> ...and in merging my code with Alyssa's new panfrost format modifier
>> support, I see panfrost does the opposite of this and treats a format
>> modifier list of only INVALID as "don't care".  I modeled the new nouveau
>> behavior on the Iris driver.  Now I'm not sure which is correct :-(
> 
> ....and neither am I. Uh-oh.
> 
> I modeled the panfrost code after v3d_resource_create_with_modifiers,
> which treats INVALID as "don't care". I can confirm the panfrost code
> works (in the sense that it's functional on the machines I've tested),
> but I don't know if it is actually correct. I think it is, since
> otherwise you end up using linear in places it's unnecessary, but I'm
> not sure where this is spec'd.

It would depend on whether an app actually calls the function this way, 
and whether that app was tested I suppose.  If I'm interpreting the Iris 
code correctly and it doesn't break anything, then I'm assuming both 
implementations are equally valid in that nothing exercises this path, 
but it would be good to have the intended behavior documented somewhere 
so we can try to work towards consistent in case someone tries it in the 
future.

My nouveau change runs afoul of assumptions in the tegra driver, but 
that's easy enough to fix in lockstep if desired.

Also, heads up: I'll ping you on my format modifier cleanup MR once I've 
pushed the latest version.  The panfrost modifier usage was harder to 
merge into the refactoring than most, so it'll be good to have your 
review and if you have time, some testing.  I think I landed on an 
elegant solution, but open to suggestions.

Thanks,
-James
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
