Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 151753248E2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 03:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3051889D9B;
	Thu, 25 Feb 2021 02:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C771889CF4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 02:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUINbJktJyktuwDqNHHaN7eJ0hGX5OEiHbD257YYAJZQ8GEtVd3CpQd4TPKR29hD73Vu+Ka9OgVmJDNADKzxh+RMf0MkuEtsfZYCTZjPpcum0seNLqA+qfrVBJ0wRQ+xtUhvSUQLT1lL28FwXd4ODAT75f5XvSYoW9ARlmLfXvkdFffDGv32o028D+BT5YOZ9/CXGgaY9j8kim5HGx87PxBWqUrOiNKIrQdEg/ovfNgQG2bg9jkE2ANyXSwCtkSM43tu6qQy6Oaxej/ws7QeWoixb/JZLWABvD6EbrC6KTkLm5oSxxWZ8QH3deamfmECCJ+fvxE6/bbfI8X+CHrMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrGacAg2KMSeLERA18QjLBOzjT4L7F1WNi5Z1BGhyaI=;
 b=M47PnxQtC008jBZ/OH56Qyc1w19YhE62fr7MsW1D44mehaGpSln1/s87bdmhYhICJ4PYK8vWPyef5rElSLS7Ux7eTR6BlTit1OdqEsouXbsfhHmdOYIA2nIJYgdezEru09RM7LpIv86geBZZ0LkwCeAWkDSmXz/2PfVVWwtIpmsEe6E5QIFPn6cxAGtdHqlm7SJWTvFgM4qS7U8fV7B3g2MH014GHO3LG4ATInD/LNwEs37vqqdi51XC0ddH2LYp87Oozqn6UIhYSVihOyDHpjqotyEqS+7NdWM8JqgNHpBUuTdKV/Jh81AZV8nC2+nY7xAEHV3Fl+PXlWDitVQBIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrGacAg2KMSeLERA18QjLBOzjT4L7F1WNi5Z1BGhyaI=;
 b=Nx0LWy1rXQvpag5pdEVAKkiluW54ZqGSTH/xf9w8SA8GZlv+Agr6MzLd6/x9boUh3gGYpZEKJrxl97GwfuxA2nQnlqxgHNVhYYKEdXqtb2i/Zamu5r0lE7mtQYwaBYshJ62991grST8l6WDcSXO+PxSsjeWCjVNxk/hw66bIFkk=
Received: from BN8PR12MB4770.namprd12.prod.outlook.com (2603:10b6:408:a1::30)
 by BN8PR12MB3362.namprd12.prod.outlook.com (2603:10b6:408:44::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Thu, 25 Feb
 2021 02:32:28 +0000
Received: from BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::2054:faac:dec5:d93]) by BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::2054:faac:dec5:d93%6]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 02:32:28 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "lyude@redhat.com" <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 0/2] Set CLEAR_PAYLOAD_ID_TABLE as broadcast request
Thread-Topic: [PATCH v2 0/2] Set CLEAR_PAYLOAD_ID_TABLE as broadcast request
Thread-Index: AQHXCpY0DEYRJMD5VUGE2cXXmPgsRqpnmwMAgACLtQA=
Date: Thu, 25 Feb 2021 02:32:27 +0000
Message-ID: <BN8PR12MB4770EFCCD1B4D0D363B95FC9FC9E9@BN8PR12MB4770.namprd12.prod.outlook.com>
References: <20210224101521.6713-1-Wayne.Lin@amd.com>
 <10aa57cb1a982cbc07195319580bc9604961f186.camel@redhat.com>
In-Reply-To: <10aa57cb1a982cbc07195319580bc9604961f186.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=0dbf33d4-f1d5-48d8-935b-3e78014334bf;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-02-25T02:29:21Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.134.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f8846ce0-ea59-457c-2cc5-08d8d9359809
x-ms-traffictypediagnostic: BN8PR12MB3362:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB336284557FDEF715B1EF9EC8FC9E9@BN8PR12MB3362.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xm/xzY19GPRwI6kRBS4LyUJqdP9WLKWlt7GAYaCxMXPxXMG0VkHYyBAaIJMcXi2+YnO1akysJ57tNC4DKtCFdDt90zpRJVj7IfRVHBFS4ZIzUOcqcFPAruJKcg7X3FrycY+3/QcuSQBunRSEyq9qDHhbbFFw1Oqeb8MA1G0XatzigOg5kz3eZmuNhqFz/LInGOWdpDAYY0cU7uZ/yAw7X6qCbAWOfOPxQ5CmQZ4iMskVzVHMTSeayNCNlpSgIZGXuilz5rS3jD3f/1QeY98lzxAHfMa/grimIZIKrfWco7QBzq9n73Xm75G0a8LvmS6LBmhPfngE/gyrHRzUMmAXh+QoLBem51Kb8S6m3hRlT7gk98PVfhDOPLk6m3Tr7Mp6snfAAVa7AHBQRhbLqXOXd6NkM2O5SgElbZsdMAK5wkZTeVLtrEUWA20yjziMA/3ORKt2AqBvkZKN1n6NlEGiFYQkAgJIDHtd7mA3HnoZvfv2Bgr9COmDxbNrnN8SnIKymQlmgG0sDNgwB2FMdygDrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB4770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(55016002)(83380400001)(66476007)(76116006)(66946007)(4326008)(52536014)(110136005)(33656002)(9686003)(316002)(64756008)(7696005)(71200400001)(478600001)(86362001)(66446008)(54906003)(66556008)(5660300002)(8936002)(6506007)(53546011)(2906002)(186003)(26005)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QWFXd29vTDhMZ3d6RlNRQUpNYUZlZkYxSjFUZ3hlMUQwWlpuRTNicnM2aGZV?=
 =?utf-8?B?UHhPLzlsMWdwQzg1T0RSVXN6dEVLZ3piSG5ZT1pnOFpueEVuT0RlbmthbmNP?=
 =?utf-8?B?aE1wNG12bURRYktYNEN0ZE9wazJydkx3WHIyL00rQWNhZHhTMStLUXNwSUxM?=
 =?utf-8?B?eHdNNEVMdlBGRFZXdUgxVElRaE9SZnBxWEE1dWZ1NEN2RnIrTjZJZ3A2akY2?=
 =?utf-8?B?b1RpM29qakpLNTVuUGd4N3pmb3VnNUpady9vaWlGTnErSlJyTFJLSlA0WDlx?=
 =?utf-8?B?emZ3MEh4eW9qRm9idm52dkFYV3hmS2ExUEg2MUg3YmtVbm5DVm1WeStXQ1hN?=
 =?utf-8?B?M2JVd0VQMHNzeGZocGZtS1U0QTlpVWY0UDBDQW1YTDE0WWZtamIvSHJmUW1W?=
 =?utf-8?B?QjVqTEUyZU1nQ3ZlOUpPcmtBZ3hGUTlrVExkWlgyWXZLczBxbjQ3Z2lBWDR3?=
 =?utf-8?B?c1NtN1hJbnlMYlZySVZ1VStXRllNQ2ZOZ2Z3NnVMZXFjNEpDQVlhMlQwcUpO?=
 =?utf-8?B?Yll6QzZRSzVDcEhOUENxbHkvK0s1RVdYd0FHd2dxTVFhL1R6QW9rS1N0cHFw?=
 =?utf-8?B?ektkSHNPaldQNlVzcjVKUzc4N1FlQ2wvTWlFcjhvUGRtS0lsRmQvaUM1dkZt?=
 =?utf-8?B?Y2hZcWlQSlRVNzBJeEVpRFI3ZTdYd1A1UjNDSCs0UEhUZ0VsZEJUczE1eDFU?=
 =?utf-8?B?RFZFdDNIdUNxWlhTaVB3WTFCUEYzcjNvV3NJbVBkb201QXlYeGxnUDAwalNL?=
 =?utf-8?B?NFFMeEFlR2hYZFVNM1VDSkVQQzQ5NmtySk8xNVQzUHkwaEZDcDRRcU9jR3Jp?=
 =?utf-8?B?d0FxeFIxdW10anp1cDVuOW9OS2o4d1JPUE9yYnI5VmN4WGxZTXd0K1RQQjFJ?=
 =?utf-8?B?Uzg0L0MxWHdZcW5pZk5wZXg1VEVTOGJqYWpkc0RSRDVrMVNmSzZUMGYzc01k?=
 =?utf-8?B?eU95TW1KYmpzSzJzRjBXK3FVRmY2V3NiT1FjWEpleGVjVzR5dWQ1b0VZREhy?=
 =?utf-8?B?d0xlczd6OVd3TFJRRkdMR3duQnB5Y2JyQ083UWRUTlBwY0lOWXRtZ3BoVEdy?=
 =?utf-8?B?Y1VyR1QvZitCSXFLV1JScWIvR2ZjWlpHNUJpRzJYY2ZZbGQ2UHlwOURKUEF4?=
 =?utf-8?B?WXVSV01rbGM4amNYYXVmSjgrSGtTVG96SFU4VmpXSnVvbkNOam9sS1Uyb3pL?=
 =?utf-8?B?S0k4emJ5a3RsS2J2b2pPQ3I0YWJyOENkYU9iYXV2UENPcmNMdWN0U3MvSVFx?=
 =?utf-8?B?c0VzZVpSRXllaHJ1UUJ5ZEticGpueitCK1RzY2RqeEF5dkFiand1MldSQzZL?=
 =?utf-8?B?ZGpQRGFCZXFKVDExL0c5MzRXMzVWOWU3a0E3aEtYQmJqelJUVDRTZnUzbHUw?=
 =?utf-8?B?aEZuUlE2b2NxSDE4OVlxM3ZkQllZOUI0dVV2bUsyZ0JSL2VaWEUwUG4rRzJE?=
 =?utf-8?B?aXR6ckU3UTNkU080ZmFwSk9VeFRxR1RrRnlxSWltcTVhUStPUnhDVzRVZXk3?=
 =?utf-8?B?d0JQKy9LTDN4MGhtZ3lmb0N0YUhvSkFVUVRpNmVjSE1GQSt2VVlOQVlWajlC?=
 =?utf-8?B?L2NCNmE2RDROL0o3b0t6cS9uTHFSTmFodkVoRDVZUkRPTkY3Y3p4T1FzNFhD?=
 =?utf-8?B?ZnZQdlR3aXFGbTBFNjJLb3ZZdEFoQzdoYzBRVThRZ1ZUeFhQclYrbEhUTkRF?=
 =?utf-8?B?VDVSdlZ2NWtmQzE5bGZ3WHQwN044eGlncnJKUWpGSjFQNThvMGpXL296MGZa?=
 =?utf-8?Q?KA8TsC89Ckq5OEbGSzQ7vYjBeRC5EvfzQUm3qhf?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8846ce0-ea59-457c-2cc5-08d8d9359809
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 02:32:27.9087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6HVBd5Jsgnc9VHljJB+rQywT5chL0fmxhPkFvocNYluW4ce7Ejul4FcKVLhNIXVQJD6Km/UNgMZ2ySlc85NXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3362
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
Cc: "Brol, Eryk" <Eryk.Brol@amd.com>, "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

Thanks Lyude!

Regards,
Wayne

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Thursday, February 25, 2021 2:09 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; stable@vger.kernel.org; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry
> <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>; Brol, Eryk <Eryk.Brol@amd.com>; Zhuo, Qingqing
> <Qingqing.Zhuo@amd.com>
> Subject: Re: [PATCH v2 0/2] Set CLEAR_PAYLOAD_ID_TABLE as broadcast request
>
> also - I meant to reply to v2, not v1 :). Just so you don't worry that I pushed the wrong patch series version
>
> On Wed, 2021-02-24 at 18:15 +0800, Wayne Lin wrote:
> > While testing MST hotplug events on daisy chain monitors, find out
> > that CLEAR_PAYLOAD_ID_TABLE is not broadcasted and payload id table is
> > not reset. Dig in deeper and find out two parts needed to be fixed.
> >
> > 1. Link_Count_Total & Link_Count_Remaining of Broadcast message are
> > incorrect. Should set lct=1 & lcr=6 2. CLEAR_PAYLOAD_ID_TABLE request
> > message is not set as path broadcast request message. Should fix this.
> >
> > Changes since v1:
> > *Refer to the suggestion from Ville Syrjala. While preparing hdr-rad,
> > take broadcast case into consideration.
> >
> > Wayne Lin (2):
> >   drm/dp_mst: Revise broadcast msg lct & lcr
> >   drm/dp_mst: Set CLEAR_PAYLOAD_ID_TABLE as broadcast
> >
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > --
> > 2.17.1
> >
>
> --
> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>
> Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've asked me a question, are waiting for a review/merge on a
> patch, etc. and I haven't responded in a while, please feel free to send me another email to check on my status. I don't bite!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
