Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E1D3707B9
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 17:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294FD6E5D1;
	Sat,  1 May 2021 15:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC236E5D1
 for <dri-devel@lists.freedesktop.org>; Sat,  1 May 2021 15:27:07 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso1222059otn.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 May 2021 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=Coc7dLHm8d1NCCPTWT8okM0xdbMyDxa8abEXICC0WzU=;
 b=nmZZsNU9bGgi6d100SUxX8qRnM+9rQOjQcLPNuGaqrrtwlq0K55/GJ/9pRy9N1zcP4
 aDl/0uRah7F1x5EeGocHs89Ew/gwvpJQnEglwsFQDsWISSYjdzVkaKv914uhovQT2vtg
 4K1Eu1+KRXMtuub1kl7lRh8zyF0A15/dt6ro5nZb7rHLxf7kqA6Y0gcf5r3KpuaXmOFF
 59e2GGHSDMqFhANxoequ9rpRqzxuEnuvqSZiMy0cr528zmU6K/WRrahRwF+IM9Iy1vJy
 cnAWT4cWi2L8wrEaie/m+I8s4p2vNlWP7p040lW4s0hm70Ye5mDcgMRtFFhushQZu4jB
 mNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=Coc7dLHm8d1NCCPTWT8okM0xdbMyDxa8abEXICC0WzU=;
 b=mw03o3/WeU7QvI6N2RWJaTjpweYtqnCc9g78M4nm8/pSE19CzwiXV8PCwD1cwAcQui
 QwlI/PK3vnACTwBwFTpgloj8AwF7CXlG0qyx5jC46ePZ3daLVv8AAMCe+wwgPu8tNSn8
 P740X/3RKWqKaUXgCj17t1CojwviNN02EaqZ0mTwfhl4n+GoSv5vjOO0UGOH3bfW9vvQ
 MZZDJYwnjhRq+casbFDQ91rItAbi2audPzDFUCS5Imql2y6ggcpmYF8zT+72JpqqL8co
 U3p/TUvqEvZAQfueUELcI/S44v6Wf0D8nrOW2i9kOmzM2seq/uOIqLf/M/fZxmvaR3wz
 tTRA==
X-Gm-Message-State: AOAM5309k82K7iB+jOG7zxgoecUrLfVlN995hry0PQNP+Hn56fUgke8Y
 KUfofE10AskoSYa7559H+80f4A==
X-Google-Smtp-Source: ABdhPJytJ2NvbPwhHIOo1EzelJ2wNBhkPI3GcDlo6+lbM8JirEgcsYUZ0DKCliBTAc8T2Szqaxpl7Q==
X-Received: by 2002:a9d:4a85:: with SMTP id i5mr7927271otf.102.1619882826282; 
 Sat, 01 May 2021 08:27:06 -0700 (PDT)
Received: from [100.64.196.46] ([209.107.186.11])
 by smtp.gmail.com with ESMTPSA id 68sm1513449otc.54.2021.05.01.08.27.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 May 2021 08:27:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Sat, 01 May 2021 10:27:03 -0500
Message-ID: <179288a4d58.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <878s4zayqh.wl-ashutosh.dixit@intel.com>
References: <20210429003410.69754-1-umesh.nerlige.ramappa@intel.com>
 <20210429003410.69754-2-umesh.nerlige.ramappa@intel.com>
 <CAOFGe95O_Q09p4c5Sru0_5E-tBG3DFGm+f-uX-_YHx-UHLOBUA@mail.gmail.com>
 <20210430222609.GC38093@orsosgc001.ra.intel.com>
 <87czubbco1.wl-ashutosh.dixit@intel.com>
 <179255a3b48.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <20210501021959.GA50683@orsosgc001.ra.intel.com>
 <878s4zayqh.wl-ashutosh.dixit@intel.com>
User-Agent: AquaMail/1.29.1-1808 (build: 102900007)
Subject: Re: [PATCH 1/1] i915/query: Correlate engine and cpu timestamps with
 better accuracy
MIME-Version: 1.0
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1442852523=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1442852523==
Content-Type: multipart/alternative; boundary="179288a4ec55f6d2817ffdca95"

This is a multi-part message in MIME format.
--179288a4ec55f6d2817ffdca95
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 30, 2021 23:01:44 "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> On Fri, 30 Apr 2021 19:19:59 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Fri, Apr 30, 2021 at 07:35:41PM -0500, Jason Ekstrand wrote:
>>> On April 30, 2021 18:00:58 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
>>> wrote:
>>>
>>> On Fri, 30 Apr 2021 15:26:09 -0700, Umesh Nerlige Ramappa wrote:
>>>
>>> Looks like the engine can be dropped since all timestamps are in sync.
>>> I
>>> just have one more question here. The timestamp itself is 36 bits.
>>> Should
>>> the uapi also report the timestamp width to the user OR should I just
>>> return the lower 32 bits of the timestamp?
>>>
>>> Yeah, I think reporting the timestamp width is a good idea since we're
>>> reporting the period/frequency here.
>>
>> Actually, I forgot that we are handling the overflow before returning the
>> cs_cycles to the user and overflow handling was the only reason I thought
>> user should know the width. Would you stil recommend returning the width in
>> the uapi?
>
> The width is needed for userspace to figure out if overflow has occured
> between two successive query calls. I don't think I see this happening in
> the code.

Right... We (UMDs) currently just hard-code it to 36 bits because that's 
what we've had on all platforms since close enough to forever. We bake in 
the frequency based on PCI ID. Returning the number of bits, like I said, 
goes nicely with the frequency. It's not necessary, assuming sufficiently 
smart userspace (neither is frequency), but it seems to go with it. I guess 
I don't care much either way.

Coming back to the multi-tile issue we discussed internally, I think that 
is something we should care about. Since this works by reading the 
timestamp register on an engine, I think leaving the engine specifier in 
there is fine. Userspace should know that there's actually only one clock 
and just query one of them (probably RCS). For crazy multi-device cases, 
we'll either query per logical device (read tile) or we'll have to make 
them look like a single device and sync the timestamps somehow in the UMD 
by carrying around an offset factor.

As is, this patch is

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

I still need to review the ANV patch before we can land this though.

--Jason

--179288a4ec55f6d2817ffdca95
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On April 30, 2021 23:01:=
44 "Dixit, Ashutosh" &lt;ashutosh.dixit@intel.com&gt; wrote:</span></div><d=
iv id=3D"aqm-original" style=3D"color: black;">
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On Fri, 30 Apr 2021 19:19:59 -0700, Umesh Nerlige Ramappa=
 wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Fri, Apr 30, 2021 at 07:35:41PM -0500, Jason Ekstrand =
wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto">On April 30, 2021 18:00:58 "Dixit, Ashutosh" &lt;ashutosh=
.dixit@intel.com&gt;</div>
<div dir=3D"auto">wrote:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Fri, 30 Apr 2021 15:26:09 -0700, Umesh Nerlige Ramappa=
 wrote:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Looks like the engine can be dropped since all timestamps=
 are in sync.</div>
<div dir=3D"auto">I</div>
<div dir=3D"auto">just have one more question here. The timestamp itself is=
 36 bits.</div>
<div dir=3D"auto">&nbsp;Should</div>
<div dir=3D"auto">the uapi also report the timestamp width to the user OR s=
hould I just</div>
<div dir=3D"auto">return the lower 32 bits of the timestamp?</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Yeah, I think reporting the timestamp width is a good ide=
a since we're</div>
<div dir=3D"auto">reporting the period/frequency here.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Actually, I forgot that we are handling the overflow befo=
re returning the</div>
<div dir=3D"auto">cs_cycles to the user and overflow handling was the only =
reason I thought</div>
<div dir=3D"auto">user should know the width. Would you stil recommend retu=
rning the width in</div>
<div dir=3D"auto">the uapi?</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The width is needed for userspace to figure out if overfl=
ow has occured</div>
<div dir=3D"auto">between two successive query calls. I don't think I see t=
his happening in</div>
<div dir=3D"auto">the code.</div>
</blockquote>
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Right... We (UMDs) curr=
ently just hard-code it to 36 bits because that's what we've had on all pla=
tforms since close enough to forever. We bake in the frequency based on PCI=
 ID. Returning the number of bits, like I said, goes nicely with the freque=
ncy. It's not necessary, assuming sufficiently smart userspace (neither is =
frequency), but it seems to go with it. I guess I don't care much either wa=
y.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Coming back to the mu=
lti-tile issue we discussed internally, I think that is something we should=
 care about. Since this works by reading the timestamp register on an engin=
e, I think leaving the engine specifier in there is fine. Userspace should =
know that there's actually only one clock and just query one of them (proba=
bly RCS). For crazy multi-device cases, we'll either query per logical devi=
ce (read tile) or we'll have to make them look like a single device and syn=
c the timestamps somehow in the UMD by carrying around an offset factor.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">As is, this patch is</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Jason Ekstrand &=
lt;jason@jlekstrand.net&gt;</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I still need to review the ANV patch before we can land this though.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">--Jason</div>
</div></body>
</html>

--179288a4ec55f6d2817ffdca95--


--===============1442852523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1442852523==--

