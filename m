Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIwjGSrrrmlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:45:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A823BF90
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE32B10E547;
	Mon,  9 Mar 2026 15:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="IVvz7eco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk
 [188.40.203.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89D610E547;
 Mon,  9 Mar 2026 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
 Cc; bh=WBE4BYEYiHFEgiKZD57SBBGeNk6HJp0iko+4tg2Na3E=; b=IVvz7eco1BytH95LowSxqi
 ZYpZQzLJEO+y9zJsdRflsvsZbGedr3VYAV6UVyuO743fTFNe+hNPVErFZ/M3eKpbxrAuaxouFHad4
 zkv8gVMnQYbzVmtLRzYr/OD8AaYKdbeGOTHx3Wbfe4phJjgg2jdjXwd17GJ7c/mCeIXQE3BBYycna
 BMPPJVrtHOTQOIqd1YyLGA8VMRluhsgRko6fw9WZznSMNHGS/JXCQkv4XKH/Pci2kI4DAbeMEKyNO
 VtCKo7ZNwBSxxw9c2XVZ0GDum/gmQ3Y6pIn77SGNccEM0ycD51kI2dNjioqY09WDSuss1lBeFDXOg
 Vo/lIJe6V6eg==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1vzcnY-005gid-P6; Mon, 09 Mar 2026 15:45:37 +0000
Message-ID: <c2422e5a-8578-4826-8517-0d2c92ec8afc@codethink.co.uk>
Date: Mon, 9 Mar 2026 15:45:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: adreno_gpu with multiple display-controllers
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 James Thomas <james.thomas@codethink.co.uk>
References: <1a284543-9946-482d-a0ce-0d72304046f6@codethink.co.uk>
 <b18a3caa-bdfd-442b-bc2e-48bcc7c4b0ad@oss.qualcomm.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <b18a3caa-bdfd-442b-bc2e-48bcc7c4b0ad@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: EB4A823BF90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[codethink.co.uk : SPF not aligned (relaxed),reject,sampled_out];
	R_DKIM_REJECT(1.00)[codethink.co.uk:s=imap4-20230908];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[codethink.co.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.163];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,3d00000:email]
X-Rspamd-Action: no action

On 26/02/2026 07:27, Akhil P Oommen wrote:
> On 2/25/2026 7:52 PM, Ben Dooks wrote:
>> I am currently looking at an SA8295P based device which has six eDP/DP
>> outputs and thus is configuring two of the qcom,sc8280xp-mdss devices.
>>
>> This is failing as the device registration as the first one binds the
>> two output channel devices and the adreno_gpu to it, followed by then
>> attempting to do the same with the next which fails as the aggregagte
>> device code can't handle this and leaves the gpu unbound.
>>
>> Fixing the aggregate device to then just causes the bind to fail as
>> the adreno_gpu is already bound to the first mdss with -EBUSY from
>> the irq code in the driver bind.
>>
>> The two driver binds are as follows:
>>
>>>> [   43.009894] adreno 3d00000.gpu: adreno_bind() bind as dev
>>>> [   43.020697] msm_dpu ae01000.display-controller: adreno_bind() bind
>>>> as master
>>>> [   43.076995] adreno 3d00000.gpu: supply vdd not found, using dummy
>>>> regulator
>>>> [   43.105257] adreno 3d00000.gpu: supply vddcx not found, using
>>>> dummy regulator
>>>> [   43.208582] msm_dpu ae01000.display-controller: bound 3d00000.gpu
>>>> (ops a3xx_ops)
>>>> [   43.233368] [drm:dpu_kms_hw_init:1173] dpu hardware
>>>> revision:0x80000000
>>>> [   43.343842] [drm] Initialized msm 1.13.0 for ae01000.display-
>>>> controller on minor
>>> [   46.013271] adreno 3d00000.gpu: adreno_bind() bind as dev
>>> [   46.024075] msm_dpu 22001000.display-controller: adreno_bind() bind
>>> as master
>>> [   46.038039] genirq: Flags mismatch irq 243. 00000004 (gpu-irq) vs.
>>> 00000004 (gpu-irq)
>>> [   46.051349] adreno 3d00000.gpu: error -EBUSY: request_irq(243)
>>> irq_handler 0x0 gpu-irq
>>
>> Looking into the adreno_bind() it then passes the drm instance from the
>> msm_dpu into the msm_gpu_init() and then I am not sure where that all
>> gets used to try and work out if we can make the resources local to
>> the adreno_gpu device and then have the two display controllers share
>> this.
>>
>> Is there anyone looking into this? I have posted an RFC for the
>> aggregate device issue, but not sure how to deal with the adreno_gpu
>> side (and having other hw issues which means I can't even get the
>> driver to work with just one mdss node).
> 
> I am not sure if binding a component to multiple masters is the right
> direction.
> 
> I believe Dmitry (CC'ed) is exploring support for multi-DPU systems and
> the direction is to decouple gpu and display.
> 
> https://lore.kernel.org/dri-devel/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com/
> Could you please check if this patch helps?

I've applied those and it does seem to be binding a device now.

Not had a chance to actually check display output yet as we may well
be moving to a different project.

I did notice there is no firmware for the zap-shader node in the
device tree, which has:

gpu@3d00000 {
	zap-shader {
		firmware-name = "qcom/sa8295p/a690_zap.mbn";
	};
};

this isn't in the linux-firmware repo, who should we ask at qcom to see
if this firmware is going to be released or where it can be found.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
