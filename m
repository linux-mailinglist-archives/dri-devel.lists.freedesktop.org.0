Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C19348CCD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457906ECE6;
	Thu, 25 Mar 2021 09:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB496ECDF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:28:39 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P9NQEx018346; Thu, 25 Mar 2021 09:28:35 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55])
 by mx0b-0039f301.pphosted.com with ESMTP id 37gquh00e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 09:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaRcxmFgj/cXrRnW8/NXrsWF+Zv5JBwy/LwCT4HMwdDsuHVmI7/E+oYpQVTnfwzRuVgpLuxwzZZc0B5vCQtLozXN38/AVvqcmBGbd7ezFcTo7zCLI085D3zS4FKTbUrytN023L1zSTrg/r14a05EtwGxEEXF+7mUbLeeBOdFA5rwFSCTPqCjWQFokc7EPN591pUbcwVDGOMrHrHqI8syBTsoR8asR0dK9lHgbHHzRWXmmjnz+Kq3Lqbu/5nPwfXQOPPnx0ah+Raa96M9KF2QeHxvKZU5hKf7CUeL79OjECOu6eiZKNqNPPyZk7XvOVqCDoDG+Fia665Us3lsaiUfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYoz0eaZeMRr/a30xcAnxfAG7E9hg9U1TCQQ+Vp8ZLs=;
 b=TCvgBRD21o1awWFfbRbcR34YRiOf451OQe04B5rlRKwUUvFutka6IHBXqIHXayuFCUqGR6LWjQk0k/d7tBnRLivFm4jiRr+ePeZ3Gyczve5BkbES4ZSp2FlTQFWZXP82nw6L2xWt6ph65zdGZnV1Hj/fRF3UNR8T1RvgjPN1Pz7b3VGF0ZwVvudPWqizCurZvMYE7AnJU/jDTXHO0SULAIZtAJL4tE7if3Ip5390WqED4GifjWD2oxTI7BiDU1sZF3KoO6Ehx+bpqma6YFtsbN4SJHMbKbYHgHwCQ98VudLL2P+re+AZeM8VjF+Xwve7o3rwhPzsxYVHXa2I6voy3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYoz0eaZeMRr/a30xcAnxfAG7E9hg9U1TCQQ+Vp8ZLs=;
 b=IbBwQ578eIEfvNcFNsG14wrg+NQrXh4lcGKmjuhGJNHKzyA+Bybe76Qo+BotO6R07FBKMO/s9pTuaV329lQPknf3Os0/J3S50/GgcOzcrf/p2FOGRj7pA57KEM2z5kTC+9uutt5EJ2v8O4YhnMU67Na7XuZr4DD6tnNUcKYx57ztXzO8ZRG2k6gpSDFl3RLqDJORdyducO/wSDKTS7hZdzKZuPLfJV/14maPM2AuAaesgh0LMf6w0ijaQG7EH7G6Lx4502qM4KRcHA9J/m13DyqB5rYes/AcHeiWaUvh4b//DDABL+G0+wGuobniG0JIRQNjQXyhXRzy8BlaeLVTxA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6242.eurprd03.prod.outlook.com (2603:10a6:20b:15c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 09:28:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 09:28:30 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared
 twice
Thread-Topic: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared
 twice
Thread-Index: AQHXIT8BvTrvCJoLoEahz8MTVepQQaqURIKAgAAoGoCAAANUgA==
Date: Thu, 25 Mar 2021 09:28:29 +0000
Message-ID: <4f1747c4-6578-4962-f51d-6d3827d0034d@epam.com>
References: <20210325061901.851273-1-wanjiabing@vivo.com>
 <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
 <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
In-Reply-To: <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2863edb-7a33-45ec-e46a-08d8ef705a31
x-ms-traffictypediagnostic: AM0PR03MB6242:
x-microsoft-antispam-prvs: <AM0PR03MB6242E1236847121F3466646CE7629@AM0PR03MB6242.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MRU+qsgURxdNHl1ibgUaqwdbS1DLJ6axIEaqTlgpBt7Q7fNRUUfitz4MIlLXLd7UL9Iu4+UIitrbV6Y+LVbRzAvMFvv0ekplVxeunDnMQst6MJYZXh347UBwmVQbnWpR6epsEQpEmjZ5rkz9NjoZn+UpGGu5VhjHdEaEUjS1Rxngfzi0aprklW2eCzs0LQyL408icMni9WukImqm6KMJgmsbXnQvlGGJXoW3GZ0Yl6ROnkhhiALskkMyviPNWI6i8u59fJF9B9arHT+ewA5Pv5hSX5S8CfZtZU//iV1A2zrWsw/zps5P3Fvn+KdJzVR7Xf9pKoiVQ/OqsdVn5VBTNsDe38CiPS+TRfDP/p6Ouzq+bIK1caHC8qo07aBdqFOvSu46WiLwCDx7pvoWSrUFELegtpW3eJK8YGjtkSbL4a9WI0xv5NxK710obgw0dUW5P1E+Kn1U7uqvhym5EBlVEK8q11WmlGz5cs9lnHKMxgOA34Pj8tPGA7MddMg89l1GgWyLyFLORW5NFH08FzDhcBjQchi1wZIf80CkrrTPTFkaGDSykWoFlqxvyVeYgAtrfmyPdp0ZwqsqZAVaWkcS4uouvL5Zfn91uKq5PBsnCbIy5kRkamjXYZ82uYIhB73Q8cEb2v2y1rSM5arjDDBoT02FHS94tNgq8EZ6F4fY9tic3c4eQxgLLJh8XHyyWMdC+Adst6+72CNEDI4aTLXu7wmrLnyZXiMG78n9ObPXURo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(2616005)(6486002)(966005)(8676002)(316002)(6506007)(8936002)(4326008)(31686004)(36756003)(71200400001)(478600001)(53546011)(38100700001)(64756008)(83380400001)(66476007)(66446008)(66556008)(31696002)(76116006)(66946007)(5660300002)(6512007)(26005)(7416002)(110136005)(186003)(86362001)(2906002)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YXJWb2JsanFHMUMyelJ6OWJaVm5UTy90VUpVU0Q4N0hJb1JBL0tDeTBYZW5Y?=
 =?utf-8?B?NDl2VW1iMG9xMEdzV0JKRUszWG1jSjc4ck0yTmdRVlhJY2w4N2svMjJMeDRy?=
 =?utf-8?B?R2V0QjR4QXB0b00ybUFTczZURWpGRG5aOEtMb09YY0xoSzVhN2Vpd0JiU3hr?=
 =?utf-8?B?a3hEQWRwbzl2ZGltaS9MSGhvWFNsei9YMFNoME0yVnFxYWF3K2hkTU5saGx1?=
 =?utf-8?B?bDBycUlmSDdYQVBpUDd6dU14MWlacjdQcmplWGQyd3pOSHlXU251QVMyTnF0?=
 =?utf-8?B?T09Ha0FwUmpXTkd6Vmlmb0QvNDQwcU80anBIVkRrNDdodU1CUUQ1RTcrOFJ3?=
 =?utf-8?B?SVVVUUwyNlExYW50ak9QZFRFa0Y5OUYxR2o5azJVbmRGYnp5b0s2TkZUNkFI?=
 =?utf-8?B?a1o2ZWNxWDVNcjJIcGxEU2ZHdWUrc0UxbHBIeEtoUXJpQlhib2hwRWwyWXZS?=
 =?utf-8?B?d0VGdnNhWWhHb3NIVHk3Y2d1MEt2NkZlYVNGVXV1dXlDN2NxVUc1dCtXTExB?=
 =?utf-8?B?OExPMHl0eGkrSE5NWENWMWVUdnJuUVk0aGVFL0hoa0d0cHhtOGJzalEvK2xw?=
 =?utf-8?B?ZEovSSs2STdjNmgvV3FSeVVIazhSVWdHWVN3UDlwaTdFVHdjTFJ0R0h5aGxE?=
 =?utf-8?B?a2VFSFRPaFI2OFBnV21pL3hCV1hDRW80emtFc2JuNHhLc2pJNG9MZUdJMjFX?=
 =?utf-8?B?blppOUJqWkJUQml5Zk0yeVo3THh6VTlIck1sZWVMWWZGUVdDZXhmZmtjcTVo?=
 =?utf-8?B?d0pZbVEzeFYvbFVHcmxqbUY4UzJSVkQrcDhlTktqOHAvUWNWQzZUWTZDV09U?=
 =?utf-8?B?dm5FVFlCdmdLaENQcjhsNDYvM3Jwb0JQcjk2eHpFRWZQV1pHUVY2NlNscXVX?=
 =?utf-8?B?Z0pkc3BRQXBZU1UvRlFWQ3BsbFlPWnhHRStlOWJxMFhpUTBYZnkzYzBVWDdu?=
 =?utf-8?B?WHVxTDU4THNjYVZIWEtVcUhiZStiWHN2bW94YUpGclBPcUh3bVRMVWphdkl3?=
 =?utf-8?B?WWR6aG5yZE1ZekRRbGZOSUpJajlrV2MxUUtwUFVXREtNK1FmZXdDNUJ4czdJ?=
 =?utf-8?B?Wk9BN0o5VzRLa1NlOFJOVFRhN0V4TVpub2ZrZnVraWhLRCtqc20wdnBHbndW?=
 =?utf-8?B?bnQ0a3ZFRlhsSEJncHEwZlExOFBuRk9jSDFoTi9XUlRwWHplMUEvS3RFTWtT?=
 =?utf-8?B?aXpPSXVvQ0tkSXFnb1V5Y0p4ZmptQkVvZE1xRld5VW9FWkxadDBnL0kxQmtY?=
 =?utf-8?B?b3NlN2NzVEFIS0hjQ1R4eU5OVTZUNEY4MS96bjlYQzRWQVZCdm1KTy9yeUQ2?=
 =?utf-8?B?L2JNWGp6elBpSitoRDZzZkpaZkJkUHpNTzNYWVd3b1c1dWtjNWErc0VKRGlr?=
 =?utf-8?B?MFhtekZNb2ZFWGlpV2lObjJNa2szL1ZCY2l0RnlOd2w1U0c3WUwwTy9YMWx6?=
 =?utf-8?B?eDFjNHMrUDlPSXpwQjB1SFpOSU1CQzFYL1NBWmg4Y0JvVmkrVGZsNUdrR1lt?=
 =?utf-8?B?amd4c2hFc29uQ1F5TituUEZ0L2NjYXM2cHNtWVY3RjUzTzVUZzRXRzhWdWR6?=
 =?utf-8?B?MHVYMTdCYW1TZDhFTDZaWEtHR2syUHNOTkhyQ2tJanFNSmNzY0xZT1kwd2p2?=
 =?utf-8?B?WjFROFRzOUNDY1dlaXhZelA2cCtya01jUnVHMlQrUTZyNEw5VmZJUzlxMXdt?=
 =?utf-8?B?dFhBSmx5di9xbmVtVndaaGFTa1E3T05FNG56bXMrZzR6Q1BsUmdNY3hhM1BP?=
 =?utf-8?Q?1Mht6ITVpj5kPEjWZYUvkUANjhE/NtsAUeUunhr?=
x-ms-exchange-transport-forked: True
Content-ID: <2FDE5AD638AED24DB25128A5783265F1@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2863edb-7a33-45ec-e46a-08d8ef705a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 09:28:30.0305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCK8YxA7kzzlFmCmaMkm/kubi0FqItAPaE7cy+NzP4Id8thpLKXYIBRm+xHvRQgbowxGQrAJ3e6ebAsUeOwLbL+skdAvJRStxyo5YQyUKCh2ek335yrNkK2UfVL0+Yoh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6242
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=986 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250071
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kael_w@yeah.net" <kael_w@yeah.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Daniel!

On 3/25/21 11:16 AM, Daniel Vetter wrote:
> On Thu, Mar 25, 2021 at 7:53 AM Oleksandr Andrushchenko
> <Oleksandr_Andrushchenko@epam.com> wrote:
>> Hi,
>>
>> On 3/25/21 8:19 AM, Wan Jiabing wrote:
>>> struct xen_drm_front_drm_info has been declared.
>>> Remove the duplicate.
>>>
>>> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>> Thank you for the patch,
>>
>> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Will apply to drm-misc-next-fixes
> drm-misc-next-fixes is the wrong tree, bugfixes outside of the merge
> window belong into drm-misc-fixes. Please consult
>
> https://urldefense.com/v3/__https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html*where-do-i-apply-my-patch__;Iw!!GF_29dbcQIUBPA!nfKNXrB-yHqaxeH6nC3mEw28HFFI1p5fc5CZKEFeoQPWXEhZCpvMqvW8EtFfTqtHPiNgpY4S-g$ [drm[.]pages[.]freedesktop[.]org]
>
> We need to hard-reset drm-misc-next-fixes back, please re-apply the
> patches (both of them) to drm-misc-fixes. Also adding drm-misc
> maintainers.
Sorry for screwing things up, will re-apply both patches to drm-misc-fixes
> -Daniel
>
>> Thank you,
>>
>> Oleksandr
>>
>>> ---
>>>    drivers/gpu/drm/xen/xen_drm_front_conn.h | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.h b/drivers/gpu/drm/xen/xen_drm_front_conn.h
>>> index 3adacba9a23b..e5f4314899ee 100644
>>> --- a/drivers/gpu/drm/xen/xen_drm_front_conn.h
>>> +++ b/drivers/gpu/drm/xen/xen_drm_front_conn.h
>>> @@ -16,7 +16,6 @@
>>>    struct drm_connector;
>>>    struct xen_drm_front_drm_info;
>>>
>>> -struct xen_drm_front_drm_info;
>>>
>>>    int xen_drm_front_conn_init(struct xen_drm_front_drm_info *drm_info,
>>>                            struct drm_connector *connector);
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
