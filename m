Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6234896E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 07:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ADB6EB35;
	Thu, 25 Mar 2021 06:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644536EB35
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 06:53:50 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P6j63W029988; Thu, 25 Mar 2021 06:53:49 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 by mx0b-0039f301.pphosted.com with ESMTP id 37gmer05qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 06:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFhhLCKUd+0HydW+yYX4rltHbaXPcYpGnwakRQC3gH5ryXAivi1kr/OVvYDmkFmlWigXPGmBvIexk3CZOI7DSPmz0RLE8+rEo9yRcdcm+dYBAiQdw6BL2U5z1SwpQseSIAGV4QtuzzlWfaWTtWnH6HJ/KXdnc/+OxdbcaWuJQRDwRyTX02CQR0cO+IoTvXd87IclO8LbBUj7HCM7Wb62qZiM28/Sb9xfCrvGsZFffIGldYu47GDBCxfZWKSueUkJCNiXGsDYH6W32srjxbO0kMyBr2rLismgk6lu0B+V1N3slVkco80Dcb91cngAt+hZVZ+AMXgTDwQKkLbblka0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBODP1W7j6ZcILAQc0m1CiDNrOSChCd9P+aXQPHAeeE=;
 b=eJJllhkPnJSqr+bTMKv7Ndh0QRPNqIoAFDfQoZJpZBK+RbX7yRBDIAiUEp6oRZrpwoyIKYJMnkdSmK5DqlVAyov/qiv3O3YT7rnKjHKT/s8aGIxdp0c9amBH2fyIcUPwv2vemn8n9bGTu+bUvRSSSIDAtINzl0aMbfEVJsfQNPNIg3IcZhHiAsYd/i1RT2c/qjLpRh2RD9VkiUlmqWiQSEdFDawJz35pwXd3gu5XBuzpIbKbZbBa06RIZ41oAx9cmgLs9GScmsDy/5detmWRExcAsGkqve2u2ClvCMGOtok7WzaOdIZEjk9zJXDWav9ZIXOSzINgdSvmLm8CYGoo7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBODP1W7j6ZcILAQc0m1CiDNrOSChCd9P+aXQPHAeeE=;
 b=ypZQ6SY22FvxcysjRg+Zl65o4EP8YvItnf3KuxMSWh5KKFsP3gl7unkXdeW5p+EE4A6XBYOL00mLcqFbFrqNDu1O8cLW5W6XL/m8DdDdPBbVzxmhOTGYy2duQ6iAX9y+toS+vjGjlNgTsF4xv8Yckl4bifaNUOUSY/FqVJNoofHJFzwoWAc7nqJRpwe7iHzhS+9cCMtjXw72GPHoX34fVXYblKS5xgGJHgYBUs/5paTuLcFpKuMcrTdFHzg+A6gYPQ7KapxdDRfXzvTGii/pOcCBwciacwIAk0iE2QOXZvCPYwQ7ledlJWKxZZzO2I3N/O7rp5MKA1bmOdwqZDWItQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3283.eurprd03.prod.outlook.com (2603:10a6:208:12::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 06:53:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 06:53:47 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH] gpu/xen: Fix a use after free in xen_drm_drv_init
Thread-Topic: [PATCH] gpu/xen: Fix a use after free in xen_drm_drv_init
Thread-Index: AQHXH4ZwjUja6WTelkeHEbGl7WGsSaqUSCcA
Date: Thu, 25 Mar 2021 06:53:46 +0000
Message-ID: <08cde91e-6276-3d59-b784-803327800896@epam.com>
References: <20210323014656.10068-1-lyl2019@mail.ustc.edu.cn>
In-Reply-To: <20210323014656.10068-1-lyl2019@mail.ustc.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mail.ustc.edu.cn; dkim=none (message not signed)
 header.d=none;mail.ustc.edu.cn; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a1f3477-368b-4a25-8140-08d8ef5abd21
x-ms-traffictypediagnostic: AM0PR0302MB3283:
x-microsoft-antispam-prvs: <AM0PR0302MB3283B2E358582D11E3F2CB34E7629@AM0PR0302MB3283.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mq0dlE0JR7G6n9lR6BXiSMJ89YeD+eLWZty+d0uXcjwBMO72+6g0AlopRFxKt62k+BS8xGkM+lkypWvAysZXgnRS/fnQ4YmYqsYWvH0OBY0hBzaoxiC+N8Jb0fgmOhleR2KzRm6XZIA8QtB2QQRyRONCGQKsMCwBEBdaaGhSLmR5Nj/761kguGXPWntw9ouHdHFqHbiCz4SApDHAUoKRNDJ8AB4xXau63Sv2GXOCSsZAG18UCYEHyDMXoaTpgwONLOKvmT0/PfH2c0mE1s8BRG1l0XBINIY2fR65epHJI8SfJnAuG+1RoOhxnc7ohyfaLpCp3s0dofkiJL05hA7tLoengNzbIxxkqiVZ+h4Efk4l0NkuTEly9hSpktFjxETDPnB1F4G4gwHUYESNdB9cOo6m9LDfcP3EZ0hFn7NNIDQR5FQQQkHt9YDM+OQvIpm2w4LeJV9WFBAXRUQ/EJ0Xqdo7xM4GYyHKiuNHBhA92172e/rjTWLroq84tEtPhEguSsuKw/GjiZn9vD9kj9fowwo04/3qH5WZzNe6rwYVVsS6E8+jSdjFjcUrBrBNdSw6OCxG94s5ookHbSO9oXMsvi3vhVxQJTwUVGJr87dwH1KS1FZT9rbBN6Bux4HbPL8jW6W76TewjVld44acizQ7YsXF/3YZ7xIeOSYxtyv47fRrItOxmwz3FDuvtG4n7CGB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(396003)(376002)(366004)(36756003)(66946007)(54906003)(5660300002)(2616005)(110136005)(66556008)(478600001)(26005)(186003)(66446008)(6486002)(316002)(6506007)(66476007)(53546011)(64756008)(76116006)(2906002)(31686004)(4326008)(86362001)(6512007)(8936002)(38100700001)(71200400001)(8676002)(83380400001)(31696002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V3JhL3Y3Z2hBbTZKUkROWTZDVnUzT1BDNk5LQ1NPZWhGUHJMTE8xM244OHVs?=
 =?utf-8?B?amkwbkJmZFBHc09zak5zbzFEUTE5V1N4UFhaNitBanRrN1JLd2YxVHJHbU10?=
 =?utf-8?B?aVhlbzVSSkpRTkdxdlhaTnZMNldtTVkySkE0cUVPL1V0L3kwVVNCcHgzblNS?=
 =?utf-8?B?aUpvcWR5ekFxSXRXZUtYVjVMVklmOWlGd2dZOWhkMTJlMFNZYlNQaDhMTXpG?=
 =?utf-8?B?eUJmZGRHcmNZV0hycVR5c0xmYlBybHJRU0hGWmZOeVFpN0xiQzV5endPblpL?=
 =?utf-8?B?RjYwakRleDhSTGZReTJUSmZlSWNrZUYwcExTeXEzNllraUU5Vzd6b3EwejRt?=
 =?utf-8?B?cThwd09XditmV3o4ZFJQRW9ZNGxLOTJWVzBUL2E3Z2k3aHAzRVNYMTY3K3ZV?=
 =?utf-8?B?NVhhOWIxT2VTRzA5dXBnT1pLc0ZJYlNhSE1DTDdPVmhWOStJbWhqcVo0S1Jv?=
 =?utf-8?B?RlEyTVN6VmxZc1NIVzcrQ0FOOGprUlRXTU04RWF1TjRaNE1yaWlTSE9hWkRX?=
 =?utf-8?B?NklMNTNnWHByUEFJeU9HTTRQKzNkaWovNWVDSmowcXR2YXBQTUJsRldBSitn?=
 =?utf-8?B?T1pucGl5WVIydXBXOHd4dVA3YVBWOU9EbGlDSUErQTluZ0QvTlA0K0ZXTmJh?=
 =?utf-8?B?ZnZUZHYrbUpsdWVXUHg1V01MMk9XV3lHaGJGMmR1K3VQSG00K0sxYmNZRnlC?=
 =?utf-8?B?WGd4TmVIN3VCbjByQ3NuMEh4aFY2WWxqNUVMZ0J3c0hMNUJwV3pFUHU3bjlK?=
 =?utf-8?B?c3o5NjhzcjFRYy9mTjdVSHdscHRNT0Q5dmtlSGh5SlZ6aExxK3AxVDFrK2FD?=
 =?utf-8?B?UnZ0SEJMc2ZvYXZCc3RoblV4cFVkTG1QTFcxdjZZbXlXWnF3TExiUElKMkpV?=
 =?utf-8?B?ZDJXV2hlaEFHQkpFV0w3ZCtrcmw3dzk2bEpZR2lRZ1hKY25WVU9jOE1sYzNX?=
 =?utf-8?B?U1I4MHRFWDBIL1lxS0VKc0Y3cXBHSnVQTm1NLzdlalJJR1l6T3lkNlQ3eU9O?=
 =?utf-8?B?cVJkVEh4M0Mya3NzdGVoZ1R4NlFjRVRQNFdoQStvVVJ1am1USXQ1UXQzR0JH?=
 =?utf-8?B?Y3NscGUwTjVOanF0Y2JIUzZyNzJSYXczMkZuNHlQeTllMGJycDh4Q0NQKzBl?=
 =?utf-8?B?WnFuQm1PYktHMll3blIyeXpFY2srd0xQeU13L1p5UXVuZ2VZWUcvb1FFMnow?=
 =?utf-8?B?L09QV2lSY1FIb05Hcll4QlV4SFpSQzhqSSthUmVBaUlGcjdUckFTcjdvcWdN?=
 =?utf-8?B?dzdUUFhlNEo0RWxOTGlqRXBhVzhxb1ZwdmxJam5GYVExb2VSSHgzQ00xL0Rr?=
 =?utf-8?B?d3M4K2lZd3NEaWN5anJPOGJ0SHVFdk5ENnNyZ0NJWnNTamx5V3VwRzhxRjJN?=
 =?utf-8?B?YUp3Zi84NHQvWGxIWGUzNkt2OVAyeDBnWmk0Ni81UWc5cE9yU2FyellxdEcv?=
 =?utf-8?B?TjJoeGVpQTRFdXZiV3VzaWhmSENRQXNlSE5od3VvSzg4dU1DRmw0cmtZRURZ?=
 =?utf-8?B?SlZ6d0tMWjF0VEFCVUdrVUlyMGVsOUtneVJTZkttYWIyMGtxRVg1cWlxTG1G?=
 =?utf-8?B?azV5M3ZFY3BEVmpIK2dIZWlaNzBha3graGJQajlyWnAvZUFDYktSaG9pSTh2?=
 =?utf-8?B?d0l6enlleFIzYXFxaWJBZGVOQVA5Vm9ldzJNaUNiWjRjWGVjMCtIbnc3R3cy?=
 =?utf-8?B?Yk9XbHE0RU9IR1h2dmdmM0pJSGFDd2YwQ2h0ZXVlUXQ3RkJ1WW92NVJVdEF4?=
 =?utf-8?Q?6NniNmstmlOfUCIKomVDF9hxHrHHFJCiyTpIkSs?=
x-ms-exchange-transport-forked: True
Content-ID: <813B40AC18E2B149A47E4F7F1C59F91E@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1f3477-368b-4a25-8140-08d8ef5abd21
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 06:53:46.7649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdHhnweOHhnw7sGQ2ybFAwFvjOHSmg0q2kUxWWQyc4QMHmSEvXWfqJPEW3Yv3ZYPmn9krO9f1Y+gG2deaMuimAP4sp5Led1B93jQ2e7pkY1M6s3G+BbDrjttSF+AETnv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3283
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=883
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250049
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

good catch

On 3/23/21 3:46 AM, Lv Yunlong wrote:
> In function displback_changed, has the call chain
> displback_connect(front_info)->xen_drm_drv_init(front_info).
> We can see that drm_info is assigned to front_info->drm_info
> and drm_info is freed in fail branch in xen_drm_drv_init().
>
> Later displback_disconnect(front_info) is called and it calls
> xen_drm_drv_fini(front_info) cause a use after free by
> drm_info = front_info->drm_info statement.
>
> My patch has done two things. First fixes the fail label which
> drm_info = kzalloc() failed and still free the drm_info.
> Second sets front_info->drm_info to NULL to avoid uaf.
>
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>

Thank you for the patch,

Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Will apply to drm-misc-next-fixes

Thank you,

Oleksandr

> ---
>   drivers/gpu/drm/xen/xen_drm_front.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 30d9adf31c84..9f14d99c763c 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -521,7 +521,7 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
>   	drm_dev = drm_dev_alloc(&xen_drm_driver, dev);
>   	if (IS_ERR(drm_dev)) {
>   		ret = PTR_ERR(drm_dev);
> -		goto fail;
> +		goto fail_dev;
>   	}
>   
>   	drm_info->drm_dev = drm_dev;
> @@ -551,8 +551,10 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
>   	drm_kms_helper_poll_fini(drm_dev);
>   	drm_mode_config_cleanup(drm_dev);
>   	drm_dev_put(drm_dev);
> -fail:
> +fail_dev:
>   	kfree(drm_info);
> +	front_info->drm_info = NULL;
> +fail:
>   	return ret;
>   }
>   
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
