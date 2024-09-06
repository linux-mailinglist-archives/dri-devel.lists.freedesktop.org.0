Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF696E9C5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 08:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EE710E173;
	Fri,  6 Sep 2024 06:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="EIlMwSvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3725710E173;
 Fri,  6 Sep 2024 06:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1725603023;
 bh=/dtohpd2jYZvgldSPgPUfPVsQXMJ8y7tzwUyHG6SqCY=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=EIlMwSvhq/xTpsgbeu0DmgAdEQrX3FtKro+WVkKt0dchOFoVHKColL59RobV2zdI5
 d+xDhYPX8nDSRuc762Nu6tcYQECmz7u6EFWcFJOtk3i6D5uE8wBiodEfSsujIGajBJ
 4oQCuYiZf/zWpZp4njQU9/njVygyH91OJ8nWiKqM=
X-QQ-mid: bizesmtp84t1725602801tkd3vxlw
X-QQ-Originating-IP: WuapCiZjmsXjdr2Bs5465eW0Whoex+fovHxihMr3iZM=
Received: from [10.4.11.213] ( [221.226.144.218])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 06 Sep 2024 14:06:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 293073832845237998
Message-ID: <31331B0B65DB108E+082759df-83d7-43ac-a519-853a6e69483d@uniontech.com>
Date: Fri, 6 Sep 2024 14:06:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915:Remove unused parameter in marco.
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com, 
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <F84191BE8AA4A690+20240831135114.497043-1-helugang@uniontech.com>
 <Ztnkt8guUcY8hg3h@intel.com> <87le06ownz.fsf@intel.com>
From: HeLuang <helugang@uniontech.com>
In-Reply-To: <87le06ownz.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
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



在 2024/9/6 01:08, Jani Nikula 写道:
> On Thu, 05 Sep 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> On Sat, Aug 31, 2024 at 09:51:14PM +0800, He Lugang wrote:
>>> The parameter dev_priv is actually not used in macro PORT_ALPM_CTL
>>> and PORT_ALPM_LFPS_CTL,so remove it to simplify the code.
>>
>> It is magically used on our back... hence the build failures that CI got.
>> Jani is doing a great clean-up work on the display code to get rid
>> of this 'dev_priv' usages in favor of a better display code separation
>> and using intel_display struct.
> 
> I actually think this should(tm) work. It's just that it needs a rebase.
> 
> BR,
> Jani.
> 
OK,thannks for your reply,I'll rebase it.
>>
>> But thanks for the patch and the interest to help.
>>
Very glad if that will be help!
>>>
>>> Signed-off-by: He Lugang <helugang@uniontech.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_alpm.c     | 4 ++--
>>>   drivers/gpu/drm/i915/display/intel_psr.c      | 2 +-
>>>   drivers/gpu/drm/i915/display/intel_psr_regs.h | 4 ++--
>>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
>>> index 82ee778b2efe..7a93ba627aa6 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
>>> @@ -330,7 +330,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>>>   			ALPM_CTL_AUX_LESS_WAKE_TIME(intel_dp->alpm_parameters.aux_less_wake_lines);
>>>   
>>>   		intel_de_write(display,
>>> -			       PORT_ALPM_CTL(display, port),
>>> +			       PORT_ALPM_CTL(port),
>>>   			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
>>>   			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
>>>   			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
>>> @@ -338,7 +338,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>>>   				       intel_dp->alpm_parameters.silence_period_sym_clocks));
>>>   
>>>   		intel_de_write(display,
>>> -			       PORT_ALPM_LFPS_CTL(display, port),
>>> +			       PORT_ALPM_LFPS_CTL(port),
>>>   			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
>>>   			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
>>>   				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
>>> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
>>> index 257526362b39..d66dbb529e1d 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_psr.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
>>> @@ -2076,7 +2076,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
>>>   			     ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>>>   
>>>   		intel_de_rmw(dev_priv,
>>> -			     PORT_ALPM_CTL(dev_priv, cpu_transcoder),
>>> +			     PORT_ALPM_CTL(cpu_transcoder),
>>>   			     PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>>>   	}
>>>   
>>> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
>>> index 642bb15fb547..b4984e589d7e 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
>>> @@ -295,7 +295,7 @@
>>>   
>>>   #define _PORT_ALPM_CTL_A			0x16fa2c
>>>   #define _PORT_ALPM_CTL_B			0x16fc2c
>>> -#define PORT_ALPM_CTL(dev_priv, port)		_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
>>> +#define PORT_ALPM_CTL(port)			_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
>>>   #define  PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE	REG_BIT(31)
>>>   #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK	REG_GENMASK(23, 20)
>>>   #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)	REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)
>>> @@ -306,7 +306,7 @@
>>>   
>>>   #define _PORT_ALPM_LFPS_CTL_A					0x16fa30
>>>   #define _PORT_ALPM_LFPS_CTL_B					0x16fc30
>>> -#define PORT_ALPM_LFPS_CTL(dev_priv, port)			_MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)
>>> +#define PORT_ALPM_LFPS_CTL(port)				_MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)
>>>   #define  PORT_ALPM_LFPS_CTL_LFPS_START_POLARITY			REG_BIT(31)
>>>   #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK		REG_GENMASK(27, 24)
>>>   #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN		7
>>> -- 
>>> 2.45.2
>>>
> 
