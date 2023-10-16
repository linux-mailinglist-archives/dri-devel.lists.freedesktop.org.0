Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65D37CA9FE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 15:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D1F10E1E3;
	Mon, 16 Oct 2023 13:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0456610E1E6;
 Mon, 16 Oct 2023 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tjTgz1VkpWE559Ez4CDuqjmTeXO6YdCAzREG3dFcRbc=; b=sPjwPdYG/qYajZWGp/l9e5Vsew
 oyu6/2EQaQyVkjQ2CjcnZxghcqawjx4Rg/sgyfZVhre/fFbG5r4u6AblXA//srP5DJO3/dYPKRFsl
 kCefoElgf051VduuQ3I5wUWDS4Mc/4yvfFCO5Eh/TiX8yLI5ctnRJ6NuqX5hX57hUSyfSxcKbJCwa
 Eenvq4v8RiVqLZycUHL3lla97mmPPBmC7Am9S9ALZsBMmHI4zlHVh77rlGmjTkSQnEJN0346qdn/d
 jmn5Oj1Fv5Jsy0jXv/hCE/jsHl7Q+IOq7VIPGJrilTV4ZLLgQ3uSmrqFAofB/gFQAtWEWfKHVUcFi
 8kpYgIRA==;
Received: from [192.168.12.174] by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qsNrN-0014in-7U; Mon, 16 Oct 2023 15:42:17 +0200
Message-ID: <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
Date: Mon, 16 Oct 2023 15:42:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <20230815185710.159779-7-andrealmeid@igalia.com>
 <1b23576d-1649-ff5c-6273-b54729ea46d8@mailbox.org>
 <b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com>
 <20231016151856.74af9305@eldfell>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20231016151856.74af9305@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com, kernel-dev@igalia.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 xaver.hugl@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, joshua@froggi.es,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On 10/16/23 14:18, Pekka Paalanen wrote:
> On Mon, 16 Oct 2023 12:52:32 +0200
> André Almeida <andrealmeid@igalia.com> wrote:
>
>> Hi Michel,
>>
>> On 8/17/23 12:37, Michel Dänzer wrote:
>>> On 8/15/23 20:57, André Almeida wrote:
>>>> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>>
>>>> Specify how the atomic state is maintained between userspace and
>>>> kernel, plus the special case for async flips.
>>>>
>>>> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>> [...]
>>>   
>>>> +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
>>>> +effectively change only the FB_ID property on any planes. No-operation changes
>>>> +are ignored as always. [...]
>>> During the hackfest in Brno, it was mentioned that a commit which re-sets the same FB_ID could actually have an effect with VRR: It could trigger scanout of the next frame before vertical blank has reached its maximum duration. Some kind of mechanism is required for this in order to allow user space to perform low frame rate compensation.
>>>   
>> Xaver tested this hypothesis in a flipping the same fb in a VRR monitor
>> and it worked as expected, so this shouldn't be a concern.
> Right, so it must have some effect. It cannot be simply ignored like in
> the proposed doc wording. Do we special-case re-setting the same FB_ID
> as "not a no-op" or "not ignored" or some other way?
There's an effect in the refresh rate, the image won't change but it 
will report that a flip had happened asynchronously so the reported 
framerate will be increased. Maybe an additional wording could be like:

Flipping to the same FB_ID will result in a immediate flip as if it was 
changing to a different one, with no effect on the image but effecting 
the reported frame rate.


>
> Thanks,
> pq
