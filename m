Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5DF599132
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6346B10E383;
	Thu, 18 Aug 2022 23:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E764A10E383
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 23:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpY+TFKinpMFspYzCsrgq7XXuh9OkSCMCBok0mpaqMngarq7tfzxRyvcwoQ+bH6Ukv9Z6naCH8mVfQWtZr61gmXpUdHBEySP37nWN/zeM8Fvn7YyCdy9OU+BHLOvqTVYG+a8OP8C4BwvqJ6rlIxGWDk+fSEwLH3FAlV8OUq2c9FMYzrNK78U0kikqolClFQjdFxKbHI/8Bar191F5T9h3kaQkYuORlxDThyeGrQvKDbj6uoSYdY9SiTU3Y0aXifcxRsNy+I+2K9jwfd5hHxwk9a0olbAlVNrZWVbS5SXvZ+1GLQLI8M3n/wnqBztFEh8My5GA8+iS7gKhm5gRdP+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgYK3ETSEO2fDT6fm+mOgSdYIG5E56EFhiz/yJU3XRs=;
 b=Gjc+PLRu154X9YGItOKS5M0/a2fV990rLLfVO6PxAjF8pY++XBQBkS6pHJcVW5abTBLX3NqKS7tLAfqrPGHtk2jL6LdiYbTHyPWs7TpPI1RkVSFv6in9oe2nH1OtTt3h8i1gi+ivjNOOo6IQXaUNNMoxU8QFxEdcZe2qmDzzweGi8YZ0PfLDg2j7zoo+ZBJAg008yctr0WJG0VuLBzSxuAuc72sYTX+iOKMkjQ/oLt+8j/joAny6F63nCdVh5hodYjMhra4oqr6i7Jc3cu0QaVv80iv7czDiJr/e2nWCHYrHphOg/O9ay09j4Tq0Fsg2Lrab0u/VksMjdYGm08x5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgYK3ETSEO2fDT6fm+mOgSdYIG5E56EFhiz/yJU3XRs=;
 b=cpHxuVZYNYU2vjZ7JVHsmGUBJfQ4tp9mJ3mZoFG6EYnpP3GpWTPmK75V0ko1rBll/uNnsHWgW/gama5tf7YR5RQimw6QWjt1BSkcWMik3PCjoFkyHkEdbHdS5Yd+qm6AKYdKkkPJ5SMLdm7AdOKagr8aUELbDUXmNHr9hl9QOlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BN8PR03MB5059.namprd03.prod.outlook.com (2603:10b6:408:d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 23:29:06 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 23:29:05 +0000
Message-ID: <aed6672e-b60f-3a02-8566-2b2dcdb05d4a@synaptics.com>
Date: Fri, 19 Aug 2022 07:28:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/2] Add pixel formats used in Synatpics SoC
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <Yv7Gc+mSEXBnV0Oc@pendragon.ideasonboard.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <Yv7Gc+mSEXBnV0Oc@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::22) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba429377-319a-473e-3cf5-08da8171712d
X-MS-TrafficTypeDiagnostic: BN8PR03MB5059:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: docjCwYY+KT4x2V9MXlv/ArVCBxeii+Vg3R0VUHgm41K5Ld0b3UK3F2kSliHNK2Lp7J7u3m3QasdnD/QrUsJrJHM9CPsogUsdK+sv3B4DCA0MRekKX2BkcBNm3y1M8kmDQqGmIug0mAegEdRX8U/n4VnNcLgy+8ma5pS7TObjWDTZ0Y6QHhnIUv4Us/ki7nTdcrAvVcPASkD60xr8Oeubl3cOPUvw+zLM/tc+c8MJ4kHal77kVXd4aOLHYVRyJ+LseYM0TuZbHo6qTtQnxi2F05o3w7EDWeVeWF7SbZvxwgHiEurUKf5vhGrXKIqpBHgzu0NyH0Mej7Zej//uNCKtgps17jRi93kZwbMG/9k85dp+mxtkEGT4ZuyaShaFodOrQ7oV/Z4WZtJveCE+17dgz0H/NY/YUuQbSd2jRAaQLHi3VBMV4X0JXHSG5iwQ2SQZOcJT47+EDiHcr7Vzp0E/5MuZwg2LK/OHK/md/nI6VBKvGjmyy4/TrxgJfs79K3ScNsev7bauBjS48x5g6jxB9+def/AvMk2DyGNuBr0IxdQ1hLDR7blyRETCSPvqx1MAPO47aZR5LlfPfwzevG9E2i+JAhofcCqHEoQ7riw5FRei6KXa9ohK0zerOHbi4kWpvyAPYTCBgwyj2nEH8Rsg0aPC2wbAdiVyrlXXyhFmrthUdHBAcMK1sh9hCzdDiGk/lVIeqDg5fGmc+lsO8lRXswgWZOdeKX8gId5MFak3u9ztPA0PDLMJPPJzZqZlL1kuvv/LgPpV4CwQrftIq/YKrSfVeIosZgCGmUoOuTRmpPFmPwRbA5DR/2Sj8wPK+Lc7n/g0HU7q/PdCVitTT4u0dWqAKys0BDpDvV951LSBtTI+s3+t2QOL7rFA3NR/ICKOOS/8L/rkG4o11+eKxqSBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(376002)(136003)(39850400004)(36756003)(86362001)(31696002)(38350700002)(31686004)(38100700002)(26005)(6512007)(6666004)(52116002)(53546011)(83380400001)(186003)(6506007)(2616005)(478600001)(316002)(6916009)(966005)(41300700001)(6486002)(2906002)(66476007)(4326008)(8676002)(66946007)(66556008)(5660300002)(7416002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGl3T095eCs0Z1pIemJYM0lkRjFhaUFmZ2ZTcm9DMFVvVzdpR3NaNVBwaEMx?=
 =?utf-8?B?OXh4STRwYmVKc2NOMmhpejJ2SStQeVZVRVpKaVoxYlg1YVFTRCtkQWdGbVQ4?=
 =?utf-8?B?MEJ6a1VUZytXKzB4cTM3SlRINUdmZXM4SW5iRnA4Q1oyUHltSVJlaTdxZ3li?=
 =?utf-8?B?cjdPVENUVkk2RHQ1QWVxNURyaUNIUEFaV1g2M01pdzl3TU1nMExwcmtOVVdM?=
 =?utf-8?B?Uk51VDZzVGdKQUhOUXlRbmkrcHVPK25Id2FGUUpnQzdRQm1lY0U0aXZoUmNB?=
 =?utf-8?B?Q3FjWWVKbFhCQWVRQVJBbkNXZVNsMlNSenQ0dExwRnIzeEdvRVV2REtVallr?=
 =?utf-8?B?Y0J1WWNYNk5ZWmpocGJNNlFSZC9ieUw0VTE3REVZL0RSanZqNUhyU1JOWkwy?=
 =?utf-8?B?bjRtM04rWXA1RExwY0J1KzEyd0VsS3RNdVpySG1ETnNwckFqaHQ0S3NkNHBE?=
 =?utf-8?B?aEZMU0FkSmRqcFRSMTV2b3VuQS85WnEyNC9IL0FxOTRuVEtWU1JMYTZoOVU0?=
 =?utf-8?B?dHFNYzNwd0kyMUFhQk5NbTR6TEFhVmd3Q0JPZjJrL3Z4ZzhpSFA0S3drVTE4?=
 =?utf-8?B?bmM2WUFDMkwzUmIrSmhNRHIrTDJTdDNoUk1FT1hWMTVmZWdjUTBWQXpjMXd0?=
 =?utf-8?B?aXYraC9KQk5MejRzellFQmF4U1NGWUlKc0VNbHJuRWVnbk9oRHZEb21haFV5?=
 =?utf-8?B?SUZkQ3F2VlJKQ2QvRGcyOEtSeXVtdlhTQ2N6WnNudXNaYndFaE5rQWNMQkNr?=
 =?utf-8?B?KzZQQ0Vpd2lHK0ZPR2xZYmJiclZDdHo4MVV1TmMyMzNRWXdzY3RzZlhjRDRi?=
 =?utf-8?B?bzArVVBMWjZCTEFXZ1RFNWk5dzR1eGRBN1B6a2N6eXVxMnl5cGNSRDJJaGpv?=
 =?utf-8?B?Skd4QVR6WW5iVWVEV25XMm9VNGIzdlh6VXNNTHNKTHJYQnlnZ2FnK1I4TG91?=
 =?utf-8?B?TU1CSVVBOENTd05QVlUwdGpMMjJSTjB0aXNYd0ZUZ3owQUVFZUVUeGlWUmw5?=
 =?utf-8?B?Y2VNSFdjZDJUME5nb1J5Qnozc2NUR1J5cGJKVzNxUlVZdFlPZnMvb0V0eHF5?=
 =?utf-8?B?MFZKQ1daRDNiK0Y1dEEvT0RpYUJsR2E0by9VOVp4QUVqTjBPVVRlckhQREdp?=
 =?utf-8?B?RUlaR2g0OE0xOHlWSFJSSHYyanpGaEpGQWFJbGlpcXU1SWpqUVJLdzJCQUhw?=
 =?utf-8?B?N0lQMFNMZURqRGE5aEpURmJUN1YyMTc2NmUraHF3Zkl2SFhyVjVzR0d6Y29z?=
 =?utf-8?B?Q1lseHZIZ3ZjNzZROG5YUmVwb0FUN3JlVmppbHZCUURTTnprVHNDdytYOHZZ?=
 =?utf-8?B?OG80ZkVBV0kyUGtpRGtueGp1THdNV2VNNzBLNEhJQlQyYnhLM25kd1pnN1JG?=
 =?utf-8?B?TnBacDd6cGJCOVVCc0VSZWZwMTlSdXZONktVNTF5SnBYKy8vV3RoQW5kV1J0?=
 =?utf-8?B?VklHV3k0SUozRW12dm5yWElXdmx0MVJjSG9oSDY2OHd6T2FLdS8wWnJWb2RN?=
 =?utf-8?B?QUs3VDJZTXorNnQ4NzVxWXFDNWNyeFBxK0lUVUhhSGhkVmkwYk5Va1k1WUhM?=
 =?utf-8?B?MW1PQjliNXJvNXRZamk3SEZPdjhXWUQ3aDJNQmZ2ZnVPRXFDOUVDVGRFVUpV?=
 =?utf-8?B?VElCRUtHcG5pMTdVTmZpcE5zaTVtbnorYjBkVndTNHdlQUR5NjVYUmVtaVdl?=
 =?utf-8?B?cTFnSnFxUGRGc2pxMUs1YnkvYjFBUExVK1NrZjJOT0UxejZwc0hWSzhQYmJL?=
 =?utf-8?B?eGdVQ08vK1l4MzBvMy85aUk2MkptWWY2VjNJNEdBVFh1VURFaTgzekMrdWtw?=
 =?utf-8?B?akV6SW1qdFg0L0VETFlmRHFiNTJjVzI5dEtHVUFzRlVxZ0ttT2JweUJCZks5?=
 =?utf-8?B?ZStFNVVlTnA4b2tSdnBkWVI2ZU1MQ2pRRFFmL0Y2TlREb2Rkc2FTVTB5R3Ns?=
 =?utf-8?B?UWE1aHh2STdkeDJpaWI0d1IzaEVLOHJybis5alVsMHRCYko5TDB5UXlvb2FL?=
 =?utf-8?B?MTRrVVZZQmgzcjlOQW5oVmlZODlaRnV2L3NocEI4ZU1zV1lUWG1GUnY4RHU4?=
 =?utf-8?B?eWhBQ3RDS3NlRkdlL2hjT1h6Z0xSMkpYMTU0QTBTNUJ2SVdNSmpFZGdHendW?=
 =?utf-8?Q?v/oBpTcRGyXq355YRWC+qs5X5?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba429377-319a-473e-3cf5-08da8171712d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 23:29:05.7830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3u3fSGWP5uu7PE0QcaD2kQUuU2tpvlxDx7WstnpZUnq2YBZZs9/0NldeecNDx3KTzHoQ0w9TOVzog0Yjtv/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5059
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
Cc: linux-arm-kernel@lists.infradead.org, tfiga@chromium.org,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/19/22 07:08, Laurent Pinchart wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Hsia-Jun,
> 
> On Tue, Aug 09, 2022 at 12:27:48AM +0800, Hsia-Jun Li wrote:
>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>
>> Those pixel formats are used in Synaptics's VideoSmart series SoCs,
>> likes VS640, VS680.  I just disclose the pixel formats used in the video
>> codecs and display pipeline this time. Actually any device with a MTR
>> module could support those tiled and compressed pixel formats. The more
>> detail about MTR module could be found in the first patch of this serial
>> of mail.
>>
>> We may not be able to post any drivers here in a short time, the most of
>> work in this platform is done in the Trusted Execution Environment and
>> we didn't use the optee framework.
> 
> Is that so for the display side too, or only for the video decoder ?
These pixel formats are using in both video decoder and display(Not the 
GPU). Besides, ISP and NPU in vs680 support some patterns of them.

Please notice that after I reviewed the compression options of our 
platform, I found using modifies are not enough to store all the 
compression options here. I would post a second version here.

I may use the same way that Intel, I would try to disclose more details 
here, hoping we could find a better way to describe them.
> 
>> Please notice that, the memory planes used for video codecs would be 5
>> when the compression is invoked while it would be 4 for display, the
>> extra planes in the video codecs is for the decoding internally usage,
>> it can't append the luma or chroma buffer as many other drivers do,
>> because this buffer could be only accessed by the video codecs itself,
>> it requests a different memory security attributes. Any other reason is
>> described in the v4l pixel formats's patch. I don't know whether a
>> different numbers of memory planes between drm and v4l2 is acceptable.
> 
> I don't think that's a problem as such, as long as both the V4L2 and DRM
> formats make sense on their own.
> 
>> I only posted the compression fourcc for the v4l2, because it is really
>> hard to put the uncompression version of pixel formats under the fourcc.
>> I would be better that we could have something likes format modifers in
>> drm here.
> 
> Agreed, we need modifiers support in V4L2. This has been discussed
> previously ([1]), and a proposal ([2]) has been submitted two years ago,
> it needs to be revived.
Thank you, I have found those v4l2_ext_pix_format, I would relay my 
comment in the email that posting synaptics v4l2 pixel formats.
> 
> [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_linux-2Dmedia_20170821155203.GB38943-40e107564-2Dlin.cambridge.arm.com_&d=DwIBaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=Ktu-e-R1Mn89Laxioh6RlL6Y2aycZ9NrJTIyONaDdRQvnlv-Nd570KldQ51vmigK&s=_7eMTIYwWUOWkXijcRfotLJlpR7G5yx-ZXuTwh9uZw4&e=
> [2] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_linux-2Dmedia_20200804192939.2251988-2D1-2Dhelen.koike-40collabora.com_&d=DwIBaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=Ktu-e-R1Mn89Laxioh6RlL6Y2aycZ9NrJTIyONaDdRQvnlv-Nd570KldQ51vmigK&s=f1dbc5ciUeIkO6VMtlRuEvXqJad2NsoaDBFyNUsSdpg&e=
> 
>> https://synaptics.com/products/multimedia-solutions
>>
>> Hsia-Jun(Randy) Li (2):
>>    drm/fourcc: Add Synaptics VideoSmart tiled modifiers
>>    [WIP]: media: Add Synaptics compressed tiled format
>>
>>   drivers/media/v4l2-core/v4l2-common.c |  1 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c  |  2 ++
>>   include/uapi/drm/drm_fourcc.h         | 49 +++++++++++++++++++++++++++
>>   include/uapi/linux/videodev2.h        |  2 ++
>>   4 files changed, 54 insertions(+)
> 
> --
> Regards,
> 
> Laurent Pinchart

-- 
Hsia-Jun(Randy) Li
