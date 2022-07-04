Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D9565E0D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 21:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DEC9149A;
	Mon,  4 Jul 2022 19:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5D59149A;
 Mon,  4 Jul 2022 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656963323; x=1688499323;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=Jx+mqVQKClB+jIdhZESBCHiuORDkWfeqiI8ialcmygk=;
 b=OuIWzoheAthKXOJ7UoEfpd328jtzNmo0537kAMt3iRTSJyYFK99QTXif
 KOGwQcQ0J7KHTnLBWWDKlDmDzmddHkbuDJ8YNCejRZtbp7+921BteMe9W
 frqAHv/FjLjoF/cNlB5t80fYAXNZjxBJGhZ/7+OOhFGCBXgvlyJ/bS21b
 CNkL8xtBRyh7cscwF0V63yiLaP5MkC1WMDHDQpHAYbaz/2HlkxPJsFGC2
 yAcTgojt1eIDbudWw5eX/Kh2XXyl2E81RWNDWZWSCdn+EvlVZ43wTLkX+
 2gZAtGAvOjJzFA+KMr+Y83RhSXgcCRfnAjdLzma2F0WFTNk5cFwYhOgts A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="369512382"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
 d="scan'208,217";a="369512382"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 12:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
 d="scan'208,217";a="619415256"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 04 Jul 2022 12:35:22 -0700
Received: from [10.249.128.238] (unknown [10.249.128.238])
 by linux.intel.com (Postfix) with ESMTP id 764AE580AF2;
 Mon,  4 Jul 2022 12:35:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Wypu3C8b1k4Fy05jClBTGrk8"
Message-ID: <093da09a-7c75-b052-d789-04404be813a6@intel.com>
Date: Mon, 4 Jul 2022 22:35:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
References: <20220626014916.5130-1-niranjana.vishwanathapura@intel.com>
 <20220626014916.5130-4-niranjana.vishwanathapura@intel.com>
 <d805c4bfb11acd1f9271a72650f39174be30501c.camel@intel.com>
 <20220630060820.GB14039@nvishwa1-DESK>
 <406c2c67ad85258d1f8ee0fa918706a7e8b6605d.camel@intel.com>
 <20220630161811.GF14039@nvishwa1-DESK>
 <d5fee715c3489b943f055f925935871fda3899e7.camel@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <d5fee715c3489b943f055f925935871fda3899e7.camel@intel.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Zeng,
 Oak" <oak.zeng@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Wypu3C8b1k4Fy05jClBTGrk8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/06/2022 20:12, Zanoni, Paulo R wrote:
>>>> Can you please explain what happens when we try to write to a range
>>>> that's bound as read-only?
>>>>
>>> It will be mapped as read-only in device page table. Hence any
>>> write access will fail. I would expect a CAT error reported.
>> What's a CAT error? Does this lead to machine freeze or a GPU hang?
>> Let's make sure we document this.
>>
> Catastrophic error.
>
Reading the documentation, it seems the behavior depends on the context 
type.

With the Legacy 64bit context type, writes are ignored (BSpec 531) :

     - "For legacy context, the access rights are not applicable and 
should not be considered during page walk."

For Advanced 64bit context type, I think the HW will generate a pagefault.


-Lionel

--------------Wypu3C8b1k4Fy05jClBTGrk8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 30/06/2022 20:12, Zanoni, Paulo R
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d5fee715c3489b943f055f925935871fda3899e7.camel@intel.com">
      <blockquote type="cite" style="color: #007cff;">
        <blockquote type="cite" style="color: #007cff;">
          <blockquote type="cite" style="color: #007cff;">
            <pre class="moz-quote-pre" wrap="">Can you please explain what happens when we try to write to a range
that's bound as read-only?

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">It will be mapped as read-only in device page table. Hence any
write access will fail. I would expect a CAT error reported.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">What's a CAT error? Does this lead to machine freeze or a GPU hang?
Let's make sure we document this.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Catastrophic error.

</pre>
    </blockquote>
    <p>Reading the documentation, it seems the behavior depends on the
      context type.</p>
    <p>With the Legacy 64bit context type, writes are ignored (BSpec
      531) :</p>
    <p>    - "<span style="color: rgb(64, 64, 64); font-family:
        &quot;Segoe UI&quot;, &quot;Arial Unicode MS&quot;, &quot;Lucida
        Grande&quot;, Helvetica, &quot;Ubuntu Light&quot;, &quot;DejaVu
        Sans&quot;, FreeSans, sans-serif; font-size: 14.6667px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">For legacy
        context, the access rights are not applicable and should not be
        considered during page walk."</span></p>
    <p>For Advanced 64bit context type, I think the HW will generate a
      pagefault.</p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
  </body>
</html>

--------------Wypu3C8b1k4Fy05jClBTGrk8--
