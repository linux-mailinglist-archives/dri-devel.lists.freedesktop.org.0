Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A27B51F63
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 19:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291910E9A6;
	Wed, 10 Sep 2025 17:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IH4SbEcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7678E10E9A6;
 Wed, 10 Sep 2025 17:48:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 26EA34456B;
 Wed, 10 Sep 2025 17:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF5CC4CEF7;
 Wed, 10 Sep 2025 17:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757526502;
 bh=0ztWwTmDi2ZzwzQNUAOEIl2hbr5ojTLDzSuY2PO0wsk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IH4SbEcdWEveaRhNvmgsmIMFByRp6rVXdwbu5/4JZNVyZRuSBFNkPE9iYzP8mVCch
 yusciDeKotqoa7woikSAdDXU1fddbSkewujMT+vE7wekHh3peOaJXK3pc5H5xMwKXh
 wYOWC2mTTbUCx+qY+D+jiLKqRuZ/J6zmZq2xN3t+ISmu00BrBcgAYKG2+CpTZ0I8T0
 O/Bx6Zp/hAWrUgFhXZHjWQhDhgbqlHNIfUzucWPfHnwEehmQpMQmptpAUzpAGsConZ
 f/Gs8x+aBLlJ6xE2mXPxxka8AwqC/koFc/4EkzPZ56Q08lxfe8xMLVKUfAAz+jn13U
 cng9KhikfgNKQ==
Message-ID: <9332e17e-380b-42cc-b078-7c5d9d09d798@kernel.org>
Date: Wed, 10 Sep 2025 12:48:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/12] PM: Introduce new PMSG_POWEROFF event
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>
References: <20250909191619.2580169-1-superm1@kernel.org>
 <20250909191619.2580169-2-superm1@kernel.org>
 <CAJZ5v0i6+UaTHDnJE6z-VFuJrXbmfiAr7Gs=z9-xaX9mS7NqGA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAJZ5v0i6+UaTHDnJE6z-VFuJrXbmfiAr7Gs=z9-xaX9mS7NqGA@mail.gmail.com>
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

On 9/10/25 8:58 AM, Rafael J. Wysocki wrote:
> On Tue, Sep 9, 2025 at 9:16 PM Mario Limonciello (AMD)
> <superm1@kernel.org> wrote:
>>
>> PMSG_POWEROFF will be used for the PM core to allow differentiating between
>> a hibernation or shutdown sequence when re-using callbacks.
>>
>> This event should not have wakeups enabled
> 
> Why?
> 
> It surely is valid to wake up the system while it is being powered
> off, especially in the hibernation case.

In the hibernation case - yes you want wakeups.

But in what is perceived as powering off the machine it's not expected 
that you would have wakeups.

If I have a USB mouse connected and set as a wakeup source, I can click 
the mouse and the machine wakes up.  A user wouldn't expect that happens 
with a powered off machine.

That's certainly not how it works today at least.
> 
> The "poweroff" transition is generally not recoverable, however, so it
> may be better to complete it and trigger a reboot if wakeup has been
> signaled.

Hmm, I'm not sure about that.  Back to hypothesizing on the USB mouse case:
If I'm entering suspend, the mouse is an enabled wakeup source and I'm 
moving the mouse the suspend should be aborted.

But if I requested the machine to be powered off and and I clicked the 
mouse while powering off that would be an "aborted power off?.
Wouldn't that be really counterintuitive to reboot instead?

IE as a user you expect that pressing the power button gets you an off 
machine, not a different result based on other activity.

> 
>> so update PMSG_NO_WAKEUP() to match it as well.
> 
> No, please.
> 
>> Tested-by: Eric Naim <dnaim@cachyos.org>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>> v7:
>>   * Reword commit
>> v5:
>>   * Re-order and split
>>   * Add tags
>> v4:
>>   * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
>> ---
>>   drivers/base/power/main.c    | 7 +++++++
>>   include/linux/pm.h           | 5 ++++-
>>   include/trace/events/power.h | 3 ++-
>>   3 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
>> index 2ea6e05e6ec90..86661c94e8cef 100644
>> --- a/drivers/base/power/main.c
>> +++ b/drivers/base/power/main.c
>> @@ -99,6 +99,8 @@ static const char *pm_verb(int event)
>>                  return "restore";
>>          case PM_EVENT_RECOVER:
>>                  return "recover";
>> +       case PM_EVENT_POWEROFF:
>> +               return "poweroff";
>>          default:
>>                  return "(unknown PM event)";
>>          }
>> @@ -369,6 +371,7 @@ static pm_callback_t pm_op(const struct dev_pm_ops *ops, pm_message_t state)
>>          case PM_EVENT_FREEZE:
>>          case PM_EVENT_QUIESCE:
>>                  return ops->freeze;
>> +       case PM_EVENT_POWEROFF:
>>          case PM_EVENT_HIBERNATE:
>>                  return ops->poweroff;
>>          case PM_EVENT_THAW:
>> @@ -403,6 +406,7 @@ static pm_callback_t pm_late_early_op(const struct dev_pm_ops *ops,
>>          case PM_EVENT_FREEZE:
>>          case PM_EVENT_QUIESCE:
>>                  return ops->freeze_late;
>> +       case PM_EVENT_POWEROFF:
>>          case PM_EVENT_HIBERNATE:
>>                  return ops->poweroff_late;
>>          case PM_EVENT_THAW:
>> @@ -437,6 +441,7 @@ static pm_callback_t pm_noirq_op(const struct dev_pm_ops *ops, pm_message_t stat
>>          case PM_EVENT_FREEZE:
>>          case PM_EVENT_QUIESCE:
>>                  return ops->freeze_noirq;
>> +       case PM_EVENT_POWEROFF:
>>          case PM_EVENT_HIBERNATE:
>>                  return ops->poweroff_noirq;
>>          case PM_EVENT_THAW:
>> @@ -1370,6 +1375,8 @@ static pm_message_t resume_event(pm_message_t sleep_state)
>>                  return PMSG_RECOVER;
>>          case PM_EVENT_HIBERNATE:
>>                  return PMSG_RESTORE;
>> +       case PM_EVENT_POWEROFF:
>> +               return PMSG_ON;
>>          }
>>          return PMSG_ON;
>>   }
>> diff --git a/include/linux/pm.h b/include/linux/pm.h
>> index cc7b2dc28574c..892bd93f13dad 100644
>> --- a/include/linux/pm.h
>> +++ b/include/linux/pm.h
>> @@ -507,6 +507,7 @@ const struct dev_pm_ops name = { \
>>    * RECOVER     Creation of a hibernation image or restoration of the main
>>    *             memory contents from a hibernation image has failed, call
>>    *             ->thaw() and ->complete() for all devices.
>> + * POWEROFF    System will poweroff, call ->poweroff() for all devices.
>>    *
>>    * The following PM_EVENT_ messages are defined for internal use by
>>    * kernel subsystems.  They are never issued by the PM core.
>> @@ -537,6 +538,7 @@ const struct dev_pm_ops name = { \
>>   #define PM_EVENT_USER          0x0100
>>   #define PM_EVENT_REMOTE                0x0200
>>   #define PM_EVENT_AUTO          0x0400
>> +#define PM_EVENT_POWEROFF      0x0800
>>
>>   #define PM_EVENT_SLEEP         (PM_EVENT_SUSPEND | PM_EVENT_HIBERNATE)
>>   #define PM_EVENT_USER_SUSPEND  (PM_EVENT_USER | PM_EVENT_SUSPEND)
>> @@ -551,6 +553,7 @@ const struct dev_pm_ops name = { \
>>   #define PMSG_QUIESCE   ((struct pm_message){ .event = PM_EVENT_QUIESCE, })
>>   #define PMSG_SUSPEND   ((struct pm_message){ .event = PM_EVENT_SUSPEND, })
>>   #define PMSG_HIBERNATE ((struct pm_message){ .event = PM_EVENT_HIBERNATE, })
>> +#define PMSG_POWEROFF  ((struct pm_message){ .event = PM_EVENT_POWEROFF, })
>>   #define PMSG_RESUME    ((struct pm_message){ .event = PM_EVENT_RESUME, })
>>   #define PMSG_THAW      ((struct pm_message){ .event = PM_EVENT_THAW, })
>>   #define PMSG_RESTORE   ((struct pm_message){ .event = PM_EVENT_RESTORE, })
>> @@ -568,7 +571,7 @@ const struct dev_pm_ops name = { \
>>
>>   #define PMSG_IS_AUTO(msg)      (((msg).event & PM_EVENT_AUTO) != 0)
>>   #define PMSG_NO_WAKEUP(msg)    (((msg).event & \
>> -                               (PM_EVENT_FREEZE | PM_EVENT_QUIESCE)) != 0)
>> +                               (PM_EVENT_FREEZE | PM_EVENT_QUIESCE | PM_EVENT_POWEROFF)) != 0)
>>   /*
>>    * Device run-time power management status.
>>    *
>> diff --git a/include/trace/events/power.h b/include/trace/events/power.h
>> index 82904291c2b81..370f8df2fdb4b 100644
>> --- a/include/trace/events/power.h
>> +++ b/include/trace/events/power.h
>> @@ -179,7 +179,8 @@ TRACE_EVENT(pstate_sample,
>>                  { PM_EVENT_HIBERNATE, "hibernate" }, \
>>                  { PM_EVENT_THAW, "thaw" }, \
>>                  { PM_EVENT_RESTORE, "restore" }, \
>> -               { PM_EVENT_RECOVER, "recover" })
>> +               { PM_EVENT_RECOVER, "recover" }, \
>> +               { PM_EVENT_POWEROFF, "poweroff" })
>>
>>   DEFINE_EVENT(cpu, cpu_frequency,
>>
>> --
>> 2.43.0
>>

