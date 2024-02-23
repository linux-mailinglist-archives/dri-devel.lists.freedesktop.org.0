Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59476860BE6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 09:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F342610EB14;
	Fri, 23 Feb 2024 08:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325F910EB14;
 Fri, 23 Feb 2024 08:11:18 +0000 (UTC)
Received: from [192.168.1.137] ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202402230911154834; Fri, 23 Feb 2024 09:11:15 +0100
Message-ID: <2d7632f0-0783-4d82-9d81-dd6bd52d5db6@daenzer.net>
Date: Fri, 23 Feb 2024 09:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: Refuse to create a KMS FB for non-P2P
 exported dma-bufs
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240222172821.16901-1-michel@daenzer.net>
 <3156ea34-0655-4b0f-9438-9113fb714373@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Autocrypt: addr=michel@daenzer.net; keydata=
 xsDiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPM0jTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD7CXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkLOwE0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpcJGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAnjICalDn2zB1
 fXqoOkGsTwElvKa5AJ9FhyKJpysFRcejfdZwrwl9xb4oOg==
In-Reply-To: <3156ea34-0655-4b0f-9438-9113fb714373@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F23.65D85324.0062,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
 Spam="Unknown"; VOD="Unknown"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-02-23 08:06, Christian König wrote:
> Am 22.02.24 um 18:28 schrieb Michel Dänzer:
>> From: Michel Dänzer <mdaenzer@redhat.com>
>>
>> Pinning the BO storage to VRAM for scanout would make it inaccessible
>> to non-P2P dma-buf importers.
> 
> Thinking more about it I don't think we can do this.
> 
> Using the BO in a ping/pong fashion for scanout and DMA-buf is actually valid, you just can't do both at the same time.
> 
> And if I'm not completely mistaken we actually have use cases for this at the moment,

Those use cases don't have P2P & CONFIG_DMABUF_MOVE_NOTIFY?

(As discussed on the GitLab issue, AFAICT P2P could be made to work even without CONFIG_DMABUF_MOVE_NOTIFY, by pinning to VRAM instead of GTT for dma-buf sharing)


> only as fallback but it would still break existing userspace and that is a no-go.

I'm obviously aware of this general rule. There are exceptions though, and this might be one.


> So rejecting things during CS and atomic commit is the best thing we can do.

It's problematic for a Wayland compositor:

The CS ioctl failing is awkward. With GL, I'm pretty sure it means the compositor would have to destroy the context and create a new one. Not sure about Vulkan, but I suspect it's painful there as well.

Similarly for the KMS atomic commit ioctl. The compositor can't know why exactly it failed, all it gets is an error code.

And there's no other way for the compositor to detect when both things can actually work concurrently.

Together, this means the compositor always has to assume the worst case, and do workarounds such as using the scanout GPU to copy from the scanout buffer to another buffer for access from another GPU. Even when direct access from the other GPU would actually work fine.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

