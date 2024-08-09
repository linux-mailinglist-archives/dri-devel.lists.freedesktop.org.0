Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA8694CF0B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 12:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DDB10E8B1;
	Fri,  9 Aug 2024 10:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sHlV68rf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C5410E8B0;
 Fri,  9 Aug 2024 10:57:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 29C35616CB;
 Fri,  9 Aug 2024 10:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233FEC4AF0D;
 Fri,  9 Aug 2024 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723201053;
 bh=P6o8+g6uHEpjsM67FUkq1z3emgbINL56ZzzNRcYZ+ss=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sHlV68rfZif4LLLbE24ToPj1h1LXhXM1r8k6+QefrHTS9rU/vSItxB5HzNcCc+bIQ
 Z6raoTYEIu1mXj2Xxt1ZBH4p+xCN6mI8bNysKbwOgpCjav05PG7pmr9QewLPiPF+5D
 Nz6YXDWfCb76BzM3yD7EQ/JXtWSEosLA3hDYYgtKvySazhWdBFeQ/HSF0p7wd78V0W
 TILJeD55KGaJF6ax73l5J2uEM77h5UzL5Cjs3ThW/4WrNjfYNJMX3ng3R1MT3qYSxJ
 Sa3WNsFfNG3BT30LmptqNUjbzAKNK+H2VZRUqfV20Fjn1AZlaGkBKCNAJrjiHnvY5l
 q360YK4dNyHNg==
Message-ID: <78970e33-c442-4846-95ad-20d78b8e8ab7@kernel.org>
Date: Fri, 9 Aug 2024 12:57:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL] drm-intel-fixes
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Tvrtko Ursulin <tursulin@igalia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
References: <ZrSFpj20b1LbBhCJ@linux>
 <8f7c531a-ecb9-4c30-b4bb-2bdf3056ff34@kernel.org>
 <3b87c155-f35d-4812-a4b3-ac5e0bfe0c18@kernel.org>
 <172319252380.21349.12392253333144037613@jlahtine-mobl.ger.corp.intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <172319252380.21349.12392253333144037613@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/08/2024 10:35, Joonas Lahtinen wrote:
> Quoting Krzysztof Kozlowski (2024-08-08 21:44:39)
>> On 08/08/2024 20:35, Krzysztof Kozlowski wrote:
>>> On 08/08/2024 10:45, Tvrtko Ursulin wrote:
>>>>
>>>> Hi Dave, Sima,
>>>>
>>>> A small bunch of fixes for the weekly cycle:
>>>
>>> ...
>>>
>>>>
>>>> ----------------------------------------------------------------
>>>> Andi Shyti (2):
>>>>       drm/i915/gem: Adjust vma offset for framebuffer mmap offset
>>>>       drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
>>>>
>>>> David Gow (2):
>>>>       drm/i915: Allow evicting to use the requested placement
>>>>       drm/i915: Attempt to get pages without eviction first
>>>>
>>>> Dnyaneshwar Bhadane (1):
>>>>       drm/i915/display: correct dual pps handling for MTL_PCH+
>>>
>>> Several commits have issues. Look:
>>>
>>>     Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>     Link: https://patchwork.freedesktop.org/patch/msgid ...
>>>     (cherry picked from commit 97b6784753da06d9d40232328efc5c5367e53417)
>>>     Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>
>>>
>>> 1. Duplicated committer SoB.
>>> You added SoB. No need to add two. It does not get stronger. You do not
>>> change the DCO rules by adding two SoBs. You cannot confirm something
>>> more or twice. Read DCO one more time...
> 
> Hi Krzysztof,
> 
> As a self-proclaimed quite active kernel developer (by a quick web search)
> you might have already ventured to look at the GIT history of the subsytem 
> tree for the patch in question. If you did that, you might have implied that
> the second S-o-b is added by automation -- and it indeed is.
> 
> While appreciating the report, maybe not so much the the condescending
> style of the communication. You now slightly come through as a troll
> hoping to be fed - I hope that is not the case.

Indeed, sorry for that. It was quite grumpy from my side.

> 
> Seems like we've had such a double S-o-b regularly generated by DIM (Drm
> Inglorious Maintainer scripts) at least since 2016 as the first occurrance
> seems to have been in ccda3a728f70 . So rest of the ecosystem seems to
> deal with them just fine.
> 
> Is the double S-o-b issue purely cosmetic for you? Not a lawyer but I don't
> think there is any legal problem in stating the same thing twice. [1]
> 
> Or are you maybe running into some more concrete issues with upstream kernel
> process related scripts or other automation processing of the commit?

The entire confusion came because, while having latest next trees, the
cherry picked commit SHA was nowhere to be found, so I assumed you just
moved it between private/work-in-progress branches. Before drm-next hits
linux-next (and I know you have different workflows), this confusion
will be for everyone who does not have drm-next remote. And yes,
processing unknown SHAs is a problem or inconvenience... which could be
easily avoided even in your cherry-pick style - first apply to fixes and
then cherry-pick (duplicate!) to drm-next.

I understand that it is just quirk of DRM development style. While, I
still disagree that duplicating commits which have 100% same diff hunks
and context (zero difference) is good, that's just personal opinion and
people can disagree.

AFAIU, the double SoB is incidental, I guess.

> 
> Regards, Joonas
> 
> [1] When it comes to the commit rights model in DRM subsystem, stripping
> the final S-o-b after the cherry-pick would make it less obvious who did
> the pick. If there are multiple S-o-bs and the cherry-picking person

Well, if you start using b4, which does much more, you notice that
process does not make information lost.

> happened to be one of them, that information would be lost. Less
> predictable outcome for the patch form for no actual gain in my opinion.
> 
> On the other hand, removing the S-o-b line from above the "(cherry-picked.."
> line would modify the cherry-picked commit description itself and I
> would assume everyone agrees that should not be done.

Sure.

One more time apologies for grumpy response.

Best regards,
Krzysztof

