Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F9557611
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4741D11A5A5;
	Thu, 23 Jun 2022 08:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CD011A5A1;
 Thu, 23 Jun 2022 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655974668; x=1687510668;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=Whi64ghsygof+6jgxvRE37LbVahudq1GCtQ+yooeRsw=;
 b=Kx8gJHWOtuWt+mwUfIg5C7mKNp+9cg3j4q3csrj/Vj2h00UEcTs8rET5
 C07x743OJ04lc/+rDJdCr+IHVR1Sg6rsgQAy6VsPjpC/HmDIDlE0lNQtV
 yesVdU9XKHOPWtqee+VvHqdf3aTzmHwsJsh7tyIvMFGgtSuW1cPc2HR0w
 kRU4/UHihbHFsm+i9GCWrm6uvu8dMC8IuXaLB6otcR5hymocIHyr5H725
 R+/26rR1SSbPiUku1E/pfYQWzxb5PcgQQ5SASJyTE/SsoaIFukvez+B8F
 KH05e7VqCJWcgYAaP4xgM38KmsHYIgD+m75J7Qi9iczBFaU8YYcBCLLXm A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281395567"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
 d="scan'208,217";a="281395567"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
 d="scan'208,217";a="592611770"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 23 Jun 2022 01:57:47 -0700
Received: from [10.249.129.203] (unknown [10.249.129.203])
 by linux.intel.com (Postfix) with ESMTP id CCBF55802A4;
 Thu, 23 Jun 2022 01:57:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------awMy26US0w3myjvV1xJosopt"
Message-ID: <1874e47b-4337-5ac6-ebea-fca21ea1ba4c@intel.com>
Date: Thu, 23 Jun 2022 11:57:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/doc/rfc: VM_BIND uapi definition
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220622035650.29256-1-niranjana.vishwanathapura@intel.com>
 <20220622035650.29256-4-niranjana.vishwanathapura@intel.com>
 <6ac2f495-8ead-4824-f9af-1c03fb3770c4@linux.intel.com>
 <20220622151229.GY376@nvishwa1-DESK>
 <b347fb63-5200-9f5c-b0d6-ca51b7a064f9@linux.intel.com>
 <20220622164445.GZ376@nvishwa1-DESK>
 <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 chris.p.wilson@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------awMy26US0w3myjvV1xJosopt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/06/2022 11:27, Tvrtko Ursulin wrote:
>>
>> After a vm_unbind, UMD can re-bind to same VA range against an active 
>> VM.
>> Though I am not sue with Mesa usecase if that new mapping is required 
>> for
>> running GPU job or it will be for the next submission. But ensuring the
>> tlb flush upon unbind, KMD can ensure correctness.
>
> Isn't that their problem? If they re-bind for submitting _new_ work 
> then they get the flush as part of batch buffer pre-amble. 

In the non sparse case, if a VA range is unbound, it is invalid to use 
that range for anything until it has been rebound by something else.

We'll take the fence provided by vm_bind and put it as a wait fence on 
the next execbuffer.

It might be safer in case of memory over fetching?


TLB flush will have to happen at some point right?

What's the alternative to do it in unbind?


-Lionel


--------------awMy26US0w3myjvV1xJosopt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 23/06/2022 11:27, Tvrtko Ursulin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e6ed0d2f-ee2a-2219-c2cc-49efc32f0560@linux.intel.com">
      <blockquote type="cite" style="color: #007cff;"><br>
        After a vm_unbind, UMD can re-bind to same VA range against an
        active VM.
        <br>
        Though I am not sue with Mesa usecase if that new mapping is
        required for
        <br>
        running GPU job or it will be for the next submission. But
        ensuring the
        <br>
        tlb flush upon unbind, KMD can ensure correctness.
        <br>
      </blockquote>
      <br>
      Isn't that their problem? If they re-bind for submitting <span
        class="moz-txt-underscore"><span class="moz-txt-tag">_</span>new<span
          class="moz-txt-tag">_</span></span> work then they get the
      flush as part of batch buffer pre-amble.
    </blockquote>
    <p>In the non sparse case, if a VA range is unbound, it is invalid
      to use that range for anything until it has been rebound by
      something else.</p>
    <p>We'll take the fence provided by vm_bind and put it as a wait
      fence on the next execbuffer.</p>
    <p>It might be safer in case of memory over fetching?</p>
    <p><br>
    </p>
    <p>TLB flush will have to happen at some point right?</p>
    <p>What's the alternative to do it in unbind?</p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------awMy26US0w3myjvV1xJosopt--
