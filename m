Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD33B675F39
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D814610E196;
	Fri, 20 Jan 2023 21:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D518010E196;
 Fri, 20 Jan 2023 21:00:44 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 c145-20020a4a4f97000000b004f505540a20so1219737oob.1; 
 Fri, 20 Jan 2023 13:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CDDzVfb3PboGUZ1ek82m5PLa0K8UtUGpbjnyxxvLkcI=;
 b=byii7Hj+8+LKxY69s+XuNvu6mpQvxsu7DtCFHAIen3WyhQhMAJAhm8joJwO2qVZqIv
 FcyaJyFJIWeLm04YUTU8SbTNDg+k83ogniWSoNAj6l/TDlRO815cSI/GQ7d7xbx7Kdxo
 IegEC6IpE1NOhx1xEN+sur71tSQMTXXSypwz922VlbXOXoBnnwePaCAy37SJ6YpJPbx0
 N5Ygtd6rnpDdhT5opZuD7czRTPM6oeywjm9NUpBG6yxgZfUQBv01H7cyC3FswEH1NOjs
 d51aiAfTOwwufO+5n00boGQd00mjshUba9xivbU2eR9k+8FuJJinAwk3PVfcShYJ8l0m
 omiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CDDzVfb3PboGUZ1ek82m5PLa0K8UtUGpbjnyxxvLkcI=;
 b=EtAaB8nTv/joud86DxWhqtRA0ZqeFiICRHQyvpAB0V/vVgt6Ua5CJk3UOITuhstGH4
 b+7y+KN4dFw2aTjTKf+J4kDAVocSgV8EjVafBYa5pE3knnmxaYBuFaQ5uFm+Zoi6cMvK
 hdlZIkDBbxJm878EwmMgjSmgZ37cAuydLDxoDIdMbQZZzDzirlWVDbAuTDw6/n2ESAim
 XKctGWJDkmZftWC9IusSX+KCMWnRpPpHoBROrz13ARL3tvkoX1qyCAf3chR5pkxQBBPj
 5n6hfngR8pt3oylDfjhd4FsJL18akj/C9Z+8PHAAq1Xpki/acH5DqDIXAOSMOtVtj9ly
 aIIQ==
X-Gm-Message-State: AFqh2kpwSwXkYS6kKT01Ky7Z7PJ1/+W4yTpDIY8JAgYxaUxxjnc5+P9p
 d7PPrItussTUTomL3gt/sUI=
X-Google-Smtp-Source: AMrXdXux2SadVMxuQYTh+X9u46rTjIh0ZWTNszXZy2RR0PyWcpRHbLUCf0qTMXzi+38BJtTTclMrug==
X-Received: by 2002:a4a:acc4:0:b0:4f2:a1c1:4dfc with SMTP id
 c4-20020a4aacc4000000b004f2a1c14dfcmr7510500oon.6.1674248443947; 
 Fri, 20 Jan 2023 13:00:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a4ac696000000b0049bfbf7c5a8sm19766449ooq.38.2023.01.20.13.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 13:00:42 -0800 (PST)
Message-ID: <9927d839-4abc-0daf-36cd-e547beb7c87d@roeck-us.net>
Date: Fri, 20 Jan 2023 13:00:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
References: <20230112085044.1706379-1-Wayne.Lin@amd.com>
 <20230120174634.GA889896@roeck-us.net>
 <a9deecb3-5955-ee4e-c76f-2654ee9f1a92@amd.com>
 <20230120181806.GA890663@roeck-us.net>
 <MN0PR12MB6101FE67D355FF2A47470C37E2C59@MN0PR12MB6101.namprd12.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
 the atomic state"
In-Reply-To: <MN0PR12MB6101FE67D355FF2A47470C37E2C59@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "stanislav.lisovskiy@intel.com" <stanislav.lisovskiy@intel.com>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/20/23 10:39, Limonciello, Mario wrote:
[ ... ]
>>>
>>> Wayne is OOO for CNY, but let me update you.
>>>
>>> Harry has sent out this series which is a collection of proper fixes.
>>> https://patchwork.freedesktop.org/series/113125/
>>>
>>> Once that's reviewed and accepted, 4 of them are applicable for 6.1.
>>
>> Thanks a lot for the update. There is talk about abandoning v6.1.y as
>> LTS candidate, in large part due to this problem, so it would be great
>> to get the problem fixed before that happens.
> 
> Any idea how soon that decision is happening?  It seems that we have line
> of sight to a solution including back to 6.1.y pending that review.  So perhaps
> we can put off the decision until those are landed.

I honestly don't know. All I know is that Greg is concerned about
the number of regressions in v6.1.y, and this problem was one
he specifically mentioned to me as potential reason to not designate
6.1.y as LTS kernel. The extensive discussion at [1] may be an
indication that there is a problem, though that mostly refers to
[lack of] test coverage and does not point to specific regressions.

Guenter

---
[1] https://lore.kernel.org/lkml/CAPDLWs-Z8pYkwQ13dEgHXqSCjiq4xVnjuAXTy26H3=8NZCpV_g@mail.gmail.com/

