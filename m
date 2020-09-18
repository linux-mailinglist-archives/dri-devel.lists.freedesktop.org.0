Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07426FD93
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949E26ECEC;
	Fri, 18 Sep 2020 12:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1ED36ECEC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GW1I0W4+NYzX5Ge2ldDS5/McMXne1ndtX4uA1o89usrC5HEhXxHDoQYPkyc+51BE/KuQADvyVV202KlMiTgrDyNCm0vBKijAcR0RbNupfCfKnTUX9d7pZTfOWdQN2G58g7fqfLcrCuBwMG6c/eT0tK8FFB0bofKompp9hafvl4w0fTCZG4wIQUppBYF+BGL1sTSEwhKxjrkWINMKviOk0mGnvLMKJg2zrjt2hB7+BY9TKJIxQGKJSeXqXVsMAvWAjTMI3HU0T8ZeVx9Mzjvo+3ex86CUhukPmMWiseLdeShqDWlp4z+SILwZX5QUifC9Vdfjdluqd8AdqZdyJUNUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NknGJK7F2Jsk4eBEpK9Kr+PlCfminnvVKITrPMBO4PI=;
 b=nYNQDImapJtNK5/cnU110XaL1mQPsPCUWllyNhEglmNifS+EpT0VdIXjPiiqdsl+HV8najmn+Pdp/QC+abR7BRiIglgd3R4RDMhC38qmguAMAuo4d1sYwZ9Ir4Zz3cw8joGWuOKLwWtrj9fyFUsr/EwkNQ/E+RoqLhEif2KZTvJnEQEQ/bTqJEQXRQFThfRzPvepjpkBl4eNzQk9+SkY4aJf+2HA14yMYDMLar+w0aljuIWv5L8PuZmBLN0Pj/f3NwehMjljrV7s4RFZrQj6UJFCvl33bznMPn+fKv+9HjQCHe2LwoPQWItp4MsRpPF1muNJ2a8T+YkDLIEK5De9Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NknGJK7F2Jsk4eBEpK9Kr+PlCfminnvVKITrPMBO4PI=;
 b=Nkjy26MfDadGAVVl3EkAfexyvpvAyccFDXkpBY9oQfSMQjRG3E93QPFVxIwihKHXAOGoY5MHuUjwFUdyfhW4zO9N5j4JtctmwD6sTh1e8BrQlDe66GBJyLCLw0bUY/O2jxis7pc8/kaMXyCCVm7AB2O76wEicKm9e/hkrE/BSeI=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2547.namprd12.prod.outlook.com (2603:10b6:207:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 18 Sep
 2020 12:53:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 12:53:28 +0000
Subject: Re: [PATCH] drm/ttm: update kernel-doc line comments
To: Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>
References: <1600422778-888-1-git-send-email-tiantao6@hisilicon.com>
 <20200918104425.GA2644518@hr-amd>
 <20200918124654.GC438822@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9f3a9ea3-0ce5-dbe1-40f4-a01b1c8369e0@amd.com>
Date: Fri, 18 Sep 2020 14:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200918124654.GC438822@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0080.eurprd03.prod.outlook.com
 (2603:10a6:208:69::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0080.eurprd03.prod.outlook.com (2603:10a6:208:69::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11 via Frontend Transport; Fri, 18 Sep 2020 12:53:26 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ef5aca7-71c2-4972-f59a-08d85bd1d66e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2547A344755805D47E7F5122833F0@BL0PR12MB2547.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lEZym2Ifq9bvr2X7Rqpp7YGF1BXGXiCbEplUFYMYXJui6Vcc5MSvhS5eI9lSRllfTXc8EpP9kgK66VHMseO37vXlJkWSayMd/ftEz2d9qxQFtEhdFDvnox+OB3sbn1MChuGG7sDGe+M0jBgddRH3+2ELalL8yMnNsnQDC068Po/Je9SmgHgHwoGnNDf7fgXTGLXTCVre9GW3svpwheg9YjYYn2Eebp4WdL+2IsrXEywzWiOqaGZGlF3T7K5i83jw9YCt4bp/gA4n9PW6a2ofSLXHoMJ9hyn23ahmhAeKG4g/4vokA89XQz7mDOnQHNoXtMGxSEqoxqAg7iM69zwvQfZ+Yw5kBepQ4hAJioSyYaBVeaBFlwupHX2pYXMy0z/R7XKLCgIoP3j75Y9jeQncnQcejM/XE9DmtJFLKoM7V/yex3Rdzggq1AoQt5aor+UE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(2906002)(6666004)(31686004)(6486002)(66946007)(4326008)(83380400001)(52116002)(86362001)(16526019)(15650500001)(36756003)(8936002)(186003)(31696002)(8676002)(2616005)(6636002)(316002)(54906003)(5660300002)(478600001)(66476007)(110136005)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FWAt+L5dwdUZ6yhDjS2BiT/cYvWHN2EruTW1BiJbF1L/Li9S/Cy7IGvjl8X2EDLI+RZ5B52FoBElpO5jOr294J8dpCH0ZLsHOJE6sfzhpbA0sLFmVpHaxHdbzkpPcLHdLKOCw1PJ78Llmr4Jp+HZrPpbifIlCLpdMhkTpHSr0xZQdsHufGeuGajn93zaI37NQ/1gOdWiv7lglWEe2tLQ4tsMkR1vthyb677PhqUS3olpiAffrn7mbHscr0+lI4hZJ0BZRTrBQxVfTZujrEc870Lxxevpi3mfLplmAzjFOfvLgyzGocCA1T2xvhEUTqD+5EiFuSkZRWx68eJOTCH13D0xysAvtfuthgeSO+GtiM9wUgiTuIO4SXfYbyznOehTx3flG79b2bQ1vRJCUDKv/KzlHAs3nWR9eS6hA35JKD0lZxu9lKqHy9KIbxmUfsm2fJQp/fIQUjhu9BGDkooWMy6EjufJUUc43hY2NWsJ3DU3CPlvCbTSSczNbNo7EX6OoYfpqcWIJ8oWJY1pQjJSxx00NePUPg5oz+cU+hwOEmRUee1q3jnqb7S5AOGWFXp4D33j5F1ZubDfIfUVFZ1WnRs7A+t61EEgGJL2cWlcLWBLCXrriZjD+3t0WfDQHwr8dG6tWEmTzjyDmJiVrIi3EYs1uwehrQa9M5VVFqahlnO2+s7Xx/QEQaAnpWUwARVaZy9BDv81TTjRiIGtMW7lJg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef5aca7-71c2-4972-f59a-08d85bd1d66e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 12:53:27.9162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRWGYeAc/MUX6mltJf6oNa/nGlslWpikxSlaT8LquXDsZabgu3FjtCARgxdITlxd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2547
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Tian Tao <tiantao6@hisilicon.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.09.20 um 14:46 schrieb Daniel Vetter:
> On Fri, Sep 18, 2020 at 06:44:25PM +0800, Huang Rui wrote:
>> On Fri, Sep 18, 2020 at 05:52:58PM +0800, Tian Tao wrote:
>>> Update kernel-doc line comments to fix warnings reported by make W=1.
>>>
>>> drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
>>> member 'glob' not described in 'ttm_shrink'
>>> drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
>>> member 'from_wq' not described in 'ttm_shrink'
>>> drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
>>> member 'extra' not described in 'ttm_shrink'
>>> drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
>>> member 'ctx' not described in 'ttm_shrink'
>>>
>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> Acked-by: Huang Rui <ray.huang@amd.com>
> It would be nice to go through ttm docs and polish them so their proper.
> This patch here just shuts up the warning without fixing any of the
> documentation issues. Fixing the docs would be much better.

Yeah, but I would do this only after Dave and I are done with re-writing 
this :)

Otherwise it is just a waste of time.

Christian.

> -Daniel
>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_memory.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_memory.c
>>> index acd63b7..0b51773 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_memory.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_memory.c
>>> @@ -259,7 +259,7 @@ static bool ttm_zones_above_swap_target(struct ttm_mem_global *glob,
>>>   	return false;
>>>   }
>>>   
>>> -/**
>>> +/*
>>>    * At this point we only support a single shrink callback.
>>>    * Extend this if needed, perhaps using a linked list of callbacks.
>>>    * Note that this function is reentrant:
>>> -- 
>>> 2.7.4
>>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
