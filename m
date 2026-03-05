Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOvFNF73qGktzwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 04:24:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4479720A80D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 04:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7227B10E161;
	Thu,  5 Mar 2026 03:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DKGavACx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E86610E161
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 03:24:09 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-506bad34f51so65287081cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 19:24:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772681048; cv=none;
 d=google.com; s=arc-20240605;
 b=DBbxXh4/rvOlO8XDwzKqTQZbvtfFeZ5Xyc5Ol+4ajOssq/NnRh1Fe+/cunV1X0RL+/
 u+AUrp/M/crgWF09JI3Tdvf81fs1+nilTlL5Vcl/zMF17YqGKjIrQKCPzMtAiM54Q9+o
 ap4J0BF34aohBPXdBmycn4F4ifJU7bO4IYXMwYdD5gMNfhc2CDIjZONMxkazccEEw1GN
 7TqhWvdUPimKWGnHHf/au4qEEj8grDRDZLfMKdrgi6E6iOWX7XAem1wmbtZcPfKYKtjp
 wwCQGmc78OcGxXCDjx1n2EkKee6DFZhM4Z7NpESUYevQyBOgSj3FEgS+k4HkW/fIHoCO
 2kmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=G5a9YB3C/nkoeFRYthM3M1t8LnTG7Q+64VSx76RGpnw=;
 fh=IqNSxu0HZPWQtX2jdRYQ55JV8sWAQ8wUicHwAFTxM/E=;
 b=l2eZVxfkln3BHISRRqYhMM4nLqx7Bet2K1ZkkzBc/3XpE46WP6dXmY72gAI9LFOuxj
 FXprTx7uaHKgHUk9n2sAuKzxnRz5KXrzq9xIk+L2cib2IhsshGZWnO1eQ2RUD+g29OrW
 w0cPje03IypNfafkE5j10N8BU/mRlwUPcZkquxSgRuyDIbEBkyrHtu/xNiA6xS60EeM/
 TRmUKNPdtREoEIGSs6CNJCYEt4RUMuPTAcL5FjPxLGr+WFqUnR2H5IXahrBAL2skuU19
 dcth1u44os72noVVTIHowImYwL3EzAVuw3cpDTUoUQq9tAcpaj3cemTcoP3VgxVLsYyb
 CoBw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772681048; x=1773285848; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G5a9YB3C/nkoeFRYthM3M1t8LnTG7Q+64VSx76RGpnw=;
 b=DKGavACxYsYsgxejjFt5w5eBH8GohQwuM5kowficqvM6uA8Dz9z7Aawqz8gbOC/93t
 09LeGEOSqIb8iHCHvNAmzOiCrQek00Eu84F2T0tKLKJjUMe4H7brteJ1dUbMhEbjzidY
 YAKUwwLPv/hHO+w+jthlVtqztxsTNjQhnBxSUtJooTXVcQthVjfm0FGdb8aNNG0WZ6iq
 n4e3L3ayw1aAeSZMtzfJqA+b8TXrkNjj+NIZSkpX2kzFvDR/9Fd5X3T4D4aQ9mqplJZk
 XePEzJe1HFY5F+IOMwWHmPZiAt386Ldz02asxtFb1ApNjG5Q+Ojy8bJS/fDQrgXSPLwO
 Qh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772681048; x=1773285848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5a9YB3C/nkoeFRYthM3M1t8LnTG7Q+64VSx76RGpnw=;
 b=d4ACGLO/UtJuXnNPWOYK6SZ5405oTz7lNEuRBFe/akxh3FUhvUdAFGRFDGu1/AGMul
 UPZcEsp5MQWMglU7TVHIyc+EXm87aKK1rmeEN+/BxxfRsdAr9PE2K29rtxwP4aXdC3oP
 +01h9EPJAIzAaPz9W9k1sqyL8ai/yuzVd4Z9UXjk4zb4u40GseFL2NyLrIettrmvJndR
 iOmOLXrBykzpf7a285XJdjTU7azjNuJHWBZMeGuWRxfOgM5x3W7EOp2jL8GAwIuOR/FO
 37BJKwimj8mZTKhgYH18ZTXNoL/3T7O1XfqTWHRodHkr4wx8pI1lLxYca82cm2M4S9lg
 Q+Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJd462fiMHFpQdcL/Qx0eZaPXAvoGTQnC39jbFASeRmK31/Lwg46+XQzi2JsIzcqmHXZ3QnVCHjXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw70yviyuoXULkK13L+1KvUcLLwbPBJFeYvwM9mji1bsgIY3YI9
 /gYInJFJqYo3QWJriFF0N5lLSUkQp9A7aWbSL4r6mCxJ64+hTQtm5WDrW+6un8r/2rcGuZQQyKB
 IReYKW1JSxEzVhXtiy0k5rrnIuQKv680=
X-Gm-Gg: ATEYQzwpL2f49RCvhZxikKp/YQ6jM4Wt/MYjhI5KjTBx3YHmbmOTybX/Lyo5WGbNwtL
 qZBXY/Gtcob08dJURuhtrq0TEZBayfe6wUXBzWM58tkNWj5lcnn8r+eY5lgdle+PKleN8sPlrp8
 WxEw0aCVKAIaFJdF9RbcIm0mriTsuL6L2HxWXXcaNxnsezIcAeBqgCLuojA+MLrIpzjxnXU09vk
 fQqgr+H+ih/yC1A4GtTR0Zx3bIf5+jxnk2rE/CrKbrOPNlc8x0Da9L3mhmM+tENJuZmAbM+DvSb
 xkIM8bX3himtU3G4mVmrfdEhC94FY1gseZsprAPf3jKr1pWI77eiPba8FqLxPOhfzUI=
X-Received: by 2002:ac8:5a82:0:b0:506:2041:13ae with SMTP id
 d75a77b69052e-508db363745mr51559771cf.43.1772681048271; Wed, 04 Mar 2026
 19:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
 <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
 <4fddf319-50c4-40ab-9e36-04d629a8855e@amd.com> <aaWZrTZGsxxjbBYv@linux.dev>
 <8efef755-e429-4cec-bef4-b15b3f9f4632@amd.com> <aaWuoe_CQwbtcxEY@linux.dev>
 <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com> <aaXEDLpXLROBO7To@linux.dev>
 <391bca8e-3685-49d5-8b30-93ab4eb1e84a@amd.com>
In-Reply-To: <391bca8e-3685-49d5-8b30-93ab4eb1e84a@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Mar 2026 13:23:56 +1000
X-Gm-Features: AaiRm52xxbcXT1ZoLRq878o0n1p8F3LnOqlotJTyAdn9potmOsnXs1KB7tA9evo
Message-ID: <CAPM=9tz1iT9pkODPH=Bs=FAFr3To78Spt2QHuNGdoFFJ_6P74w@mail.gmail.com>
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>, 
 Waiman Long <longman@redhat.com>, simona@ffwll.ch, tjmercier@google.com
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Queue-Id: 4479720A80D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:shakeel.butt@linux.dev,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,m:tjmercier@google.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

> >>
> >> What we would need (as a start) to handle all of this with memcg would be to accounted the resources to the process which referenced it and not the one which allocated it.
> >
> > Irrespective of memcg charging decision, one of my request would be to at least
> > have global counters for the GPU memory which this series is adding. That would
> > be very similar to NR_KERNEL_FILE_PAGES where we explicit opt-out of memcg
> > charging but keep the global counter, so the admin can identify the reasons
> > behind high unaccounted memory on the system.
>
> Sounds reasonable to me. I will try to give this set another review round.

I think I will try and land the first 6 patches in this series soon,
this adds the basic counters, and ports the pool to use list_lru, so
drops a bunch of TTM specific code in favour of core kernel code,

They also don't create any uapi, it's just two counters to expose in
the VM stats that the GPU is using that memory.

Dave.
