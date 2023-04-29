Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA45C6F23C1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 10:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC3410E099;
	Sat, 29 Apr 2023 08:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29F910E04F;
 Sat, 29 Apr 2023 08:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id E6E863F41E;
 Sat, 29 Apr 2023 10:55:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level: 
X-Spam-Status: No, score=-2.098 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifAiy-XCBSGm; Sat, 29 Apr 2023 10:55:53 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 030DE3F480;
 Sat, 29 Apr 2023 10:55:52 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4E24B363216;
 Sat, 29 Apr 2023 10:55:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1682758552; bh=mUo5YJJWyET87wVzHkPrGqHTYJW4xa02rhEgDnwoJrs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gQyn1fdecB0QfYT8oNt8iB4KOWIm0Yj389V3TYQqbi+S5jXw/66vMdJbs78Qn2aaM
 Bg13W52KWAekJaxTBenUGOA9mpMAKNl7SqtIsXRhOLH4p/ijhSxzKA85EsxUjOsJAn
 RXu44lj8DG6JtWIVWHeZW9f78vAvRytSNAwOS+MI=
Content-Type: multipart/alternative;
 boundary="------------Jhm0zFU0j9KxALz0lmE946Vu"
Message-ID: <06d6babb-5933-7fe5-5686-2336d695f8bd@shipmail.org>
Date: Sat, 29 Apr 2023 10:55:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/5] drm/i915: Allow user to set cache at BO creation
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230428054737.1765778-1-fei.yang@intel.com>
 <e1c73441-df6f-799c-eda0-8639067a0fea@shipmail.org>
 <BYAPR11MB25676E1468DEEB827E889DA39A6B9@BYAPR11MB2567.namprd11.prod.outlook.com>
 <73356be7-f57e-154a-e587-2785d62e61cd@shipmail.org>
 <BYAPR11MB256741725865292D644140079A6B9@BYAPR11MB2567.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <BYAPR11MB256741725865292D644140079A6B9@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Jhm0zFU0j9KxALz0lmE946Vu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/28/23 19:43, Yang, Fei wrote:
> >> On 4/28/23 17:19, Yang, Fei wrote:
> >>> On 4/28/23 07:47, fei.yang@intel.com wrote:
> >>>> From: Fei Yang <fei.yang@intel.com>
> >>>>
> >>>> The first three patches in this series are taken from
> >>>> https://patchwork.freedesktop.org/series/116868/
> >>>> These patches are included here because the last patch
> >>>> has dependency on the pat_index refactor.
> >>>>
> >>>> This series is focusing on uAPI changes,
> >>>> 1. end support for set caching ioctl [PATCH 4/5]
> >>>> 2. add set_pat extension for gem_create [PATCH 5/5]
> >>>>
> >>>> v2: drop one patch that was merged separately
> >>>>      341ad0e8e254 drm/i915/mtl: Add PTE encode function
> >>>> v3: rebase on https://patchwork.freedesktop.org/series/117082/
> >>>
> >>> Hi, Fei.
> >>>
> >>> Does this uAPI update also affect any discrete GPUs supported by i915,
> >>
> >> It does.
> >>
> >>> And in that case, does it allow setting non-snooping PAT indices on
> >>> those devices?
> >>
> >> It allows setting PAT indices specified in
> >> KMD does a sanity check so that it won't go over the max recommended
> >> by bspec.
> >>
> >>> If so, since the uAPI for discrete GPU devices doesn't allow 
> incoherency
> >>> between GPU and CPU (apart from write-combining buffering), the 
> correct
> >>> CPU caching mode matching the PAT index needs to be selected for the
> >>> buffer object in i915_ttm_select_tt_caching().
> >>
> >> The patch doesn't affect the CPU caching mode setting logic though.
> >> And the caching settings for objects created by kernel should remain
> >> the same for both CPU and GPU, objects created by userspace are
> >> managed completely by userspace.
> >>
> >> One question though, what do you mean by non-snooping PAT indices?
> >
> > Yes, that was actually the bottom question: What do these PAT settings
> > allow you to do WRT the snooping on supported discrete devices (DG2) on
> > i915?
> > If they indeed don't allow disabling snooping, then that's not a 
> problem.
>
> When dGPU's access SysMem, the PCIe default is for that access to 
> snoop the
> host's caches. All of our current dGPU's do that -- independent of PAT 
> setting.
>
> > If they do, the ttm code there needs some modification.
>
> I'm not familiar with ttm, but if your concern is that certain PAT index
> could disable snooping, that is not possible for current dGPU's.
> I think it is possible for Xe2/3 though, because there will be COH_MODE
> defined in the PAT registers going forward.


OK. If that's the case, then it should be safe to disregard this concern.

Thanks,


Thomas



>
> -Fei
>
--------------Jhm0zFU0j9KxALz0lmE946Vu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/28/23 19:43, Yang, Fei wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BYAPR11MB256741725865292D644140079A6B9@BYAPR11MB2567.namprd11.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      &gt;&gt; On 4/28/23 17:19, Yang, Fei wrote:
      <div>&gt;&gt;&gt; On 4/28/23 07:47, <a class="moz-txt-link-abbreviated" href="mailto:fei.yang@intel.com">fei.yang@intel.com</a> wrote:</div>
      <div>&gt;&gt;&gt;&gt; From: Fei Yang <a class="moz-txt-link-rfc2396E" href="mailto:fei.yang@intel.com">&lt;fei.yang@intel.com&gt;</a></div>
      <div>&gt;&gt;&gt;&gt;</div>
      <div>&gt;&gt;&gt;&gt; The first three patches in this series are
        taken from</div>
      <div>&gt;&gt;&gt;&gt;
        <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/116868/">https://patchwork.freedesktop.org/series/116868/</a></div>
      <div>&gt;&gt;&gt;&gt; These patches are included here because the
        last patch</div>
      <div>&gt;&gt;&gt;&gt; has dependency on the pat_index refactor.</div>
      <div>&gt;&gt;&gt;&gt;</div>
      <div>&gt;&gt;&gt;&gt; This series is focusing on uAPI changes,</div>
      <div>&gt;&gt;&gt;&gt; 1. end support for set caching ioctl [PATCH
        4/5]</div>
      <div>&gt;&gt;&gt;&gt; 2. add set_pat extension for gem_create
        [PATCH 5/5]</div>
      <div>&gt;&gt;&gt;&gt;</div>
      <div>&gt;&gt;&gt;&gt; v2: drop one patch that was merged
        separately</div>
      <div>&gt;&gt;&gt;&gt;      341ad0e8e254 drm/i915/mtl: Add PTE
        encode function</div>
      <div>&gt;&gt;&gt;&gt; v3: rebase on
        <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/117082/">https://patchwork.freedesktop.org/series/117082/</a></div>
      <div>&gt;&gt;&gt;</div>
      <div>&gt;&gt;&gt; Hi, Fei.</div>
      <div>&gt;&gt;&gt;</div>
      <div>&gt;&gt;&gt; Does this uAPI update also affect any discrete
        GPUs supported by i915,</div>
      <div>&gt;&gt;</div>
      <div>&gt;&gt; It does.</div>
      <div>&gt;&gt;</div>
      <div>&gt;&gt;&gt; And in that case, does it allow setting
        non-snooping PAT indices on</div>
      <div>&gt;&gt;&gt; those devices?</div>
      <div>&gt;&gt;</div>
      <div>&gt;&gt; It allows setting PAT indices specified in</div>
      <div>&gt;&gt; KMD does a sanity check so that it won't go over the
        max recommended</div>
      <div>&gt;&gt; by bspec.</div>
      <div>&gt;&gt;</div>
      <div>&gt;&gt;&gt; If so, since the uAPI for discrete GPU devices
        doesn't allow incoherency</div>
      <div>&gt;&gt;&gt; between GPU and CPU (apart from write-combining
        buffering), the correct</div>
      <div>&gt;&gt;&gt; CPU caching mode matching the PAT index needs to
        be selected for the</div>
      <div>&gt;&gt;&gt; buffer object in i915_ttm_select_tt_caching().</div>
      <div>&gt;&gt;</div>
      <div>&gt;&gt; The patch doesn't affect the CPU caching mode
        setting logic though.</div>
      <div>&gt;&gt; And the caching settings for objects created by
        kernel should remain</div>
      <div>&gt;&gt; the same for both CPU and GPU, objects created by
        userspace are</div>
      <div>&gt;&gt; managed completely by userspace.</div>
      <div>&gt;&gt;</div>
      <div class="elementToProof">&gt;&gt; One question though, what do
        you mean by non-snooping PAT indices?</div>
      <div class="elementToProof ContentPasted0">&gt;
        <div class="ContentPasted0">&gt; Yes, that was actually the
          bottom question: What do these PAT settings</div>
        <div class="ContentPasted0">&gt; allow you to do WRT the
          snooping on supported discrete devices (DG2) on</div>
        <div class="ContentPasted0">&gt; i915?</div>
        <div class="ContentPasted0">&gt; If they indeed don't allow
          disabling snooping, then that's not a problem.</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">When dGPU's access SysMem, the PCIe
          default is for that access to snoop the</div>
        <div class="ContentPasted0">host's caches. All of our current
          dGPU's do that -- independent of PAT setting.</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">&gt; If they do, the ttm code there
          needs some modification.</div>
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">I'm not familiar with ttm, but if
          your concern is that certain PAT index</div>
        <div class="ContentPasted0">could disable snooping, that is not
          possible for current dGPU's.</div>
        <div class="ContentPasted0">I think it is possible for Xe2/3
          though, because there will be COH_MODE</div>
        <div class="ContentPasted0">defined in the PAT registers going
          forward.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>OK. If that's the case, then it should be safe to disregard this
      concern.</p>
    <p>Thanks,</p>
    <p><br>
    </p>
    <p>Thomas</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:BYAPR11MB256741725865292D644140079A6B9@BYAPR11MB2567.namprd11.prod.outlook.com">
      <div class="elementToProof ContentPasted0">
        <div><br class="ContentPasted0">
        </div>
        <div class="ContentPasted0">-Fei</div>
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------Jhm0zFU0j9KxALz0lmE946Vu--
