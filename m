Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD425D1D3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024FE6EA85;
	Fri,  4 Sep 2020 07:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2303 seconds by postgrey-1.36 at gabe;
 Thu, 03 Sep 2020 08:10:54 UTC
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47886E199
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:10:54 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0837SqOC011329; Thu, 3 Sep 2020 00:32:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=QiU/FsNlbgwHQ+0mjOzySNDola4fK4n50EavepDlWoM=;
 b=CkKsyr5sixm9INIdlBLEbUVRTpbFyUCiz0CbjOayytPkfqEfz5GFhDjeRh+hZjZNQvw4
 /czvakGrJXGkbnx7rAskpo0slVKkxzQSNmLTSHlaRqQgA8Xv4ElTnBc9hpWXzDq3bsBY
 RrD0jR3GSqO5MEb377PN5uG7kwGiPAG8Te2bcC5kDDhXbmdHtqrIUIN6qD+uNm8HCvLQ
 VdpRz432wBbSc79lvhKNTaLX4Ti4RxftfzqNi3qZWrKtiev4DofNyRyJJXjHUfa2dOCx
 t+qI9gtwohKec7PylU4gnm97xEUFA33gWooAm2g0bWMsqIbHejCDUfqfv30GDnDrDK5E Qw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0b-0014ca01.pphosted.com with ESMTP id 337jkwksnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Sep 2020 00:32:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ef4ELJXVLcWFD3zsneUv7nlJFBRH1LbfSHHWJB9lYgO2y7FvuCsP7heVSw4J266abPI1pYxd8YgOfCzmVL8AIXuW30GYvfNXuwy6UjQ2vM4TJphNo2Sg6s9V3kuib6ar4ew4EGzVCYnzTdLclYHtb2mp3X5ZQHYpZX4G4M3z6GcFGKkUn3rzEXnnB1lJb8BqpA0aASmiL2y75tU9IgkoF8HSjI6KkiAEftaAQlXInm24yFpOImcBEtJafxPjOI/e8LhUBrRZyz8+lI6PnBC6Ce2qLZxoHectkSUQga4mf20SHxOAfwwCSLAykW7vfFLwo1/zqGJG9/u7FSh0rKyyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiU/FsNlbgwHQ+0mjOzySNDola4fK4n50EavepDlWoM=;
 b=bZHiyb6cUb3d5NjDeG9fmz9owVQ656ZXB2xDYv5Z6M1Wj2ym8VIdVkNyneQmmRaGEvWSdLzgrdH301kEzY5o5/Rw0SMHSQOjQNJvcfriXN45PcoOXTuqGDp2vQ7z9MVOwQIbFyWZt72SJhTsMsu7981mhxbrBNJHuGGdJYKi5uanHkAvdEaK0x60RIiWO5KijIumlbO5iTy9jnJbg9VHHl6LrKjBb8mzYQYRVaVd4ONOFwacW0N4e0kjzUDaMss3YvbReVe3EZgrrkwFDMOpWnU2ZbMwWHV1iG4fiTvhnoNwR5ldTQ5HONeYYALhx3wso3xCiaeUs7XQo/mc/FHgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiU/FsNlbgwHQ+0mjOzySNDola4fK4n50EavepDlWoM=;
 b=niNk61my/wahH37pyqZeqZlCyCy7xntVYBchySO8wlAadDtFiZk5XOTJal+af7n8HIRTVUn+n5OWROQuGBg1CIMlHQCRFJ+yBnN23H8gieaQfts7BaTpmpcgsn9pmZjtykJOwUpelev+m7QKnJ5tNwhZ/xgT38JcwqA4iYV7Srw=
Received: from DM6PR07MB5531.namprd07.prod.outlook.com (2603:10b6:5:76::15) by
 DM6PR07MB6363.namprd07.prod.outlook.com (2603:10b6:5:155::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19; Thu, 3 Sep 2020 07:32:13 +0000
Received: from DM6PR07MB5531.namprd07.prod.outlook.com
 ([fe80::c451:7f79:5f49:d9f2]) by DM6PR07MB5531.namprd07.prod.outlook.com
 ([fe80::c451:7f79:5f49:d9f2%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 07:32:13 +0000
From: Milind Parab <mparab@cadence.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Swapnil Kashinath Jakhade
 <sjakhade@cadence.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
 DPI/DP bridge
Thread-Topic: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
 DPI/DP bridge
Thread-Index: AQHWf3AYzpzGkoZ9706j21VgVUJ0X6lTdp2AgALthcCAACNHgIAAAR/A
Date: Thu, 3 Sep 2020 07:32:13 +0000
Message-ID: <DM6PR07MB55310053A35DC754C5B27FA9D32C0@DM6PR07MB5531.namprd07.prod.outlook.com>
References: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
 <1598862215-10222-3-git-send-email-sjakhade@cadence.com>
 <e53e87b0-7e0a-763f-8b8b-0dc278e1f225@ti.com>
 <DM6PR07MB5531DF749C993423B0A3E746D32C0@DM6PR07MB5531.namprd07.prod.outlook.com>
 <4a0d1e85-0db6-af62-a1ea-e8f0c684b4a6@ti.com>
In-Reply-To: <4a0d1e85-0db6-af62-a1ea-e8f0c684b4a6@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [14.142.6.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae1ae9ae-4b0c-48cb-4a7e-08d84fdb79d5
x-ms-traffictypediagnostic: DM6PR07MB6363:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR07MB63638E1178DE40A9B1BDBA36D32C0@DM6PR07MB6363.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v9/B6u73gN42vQQroC+2xEMyz0GQ2fUxiQN9lZ7P3iuNVpGxFeMPYXMK+jPQ3XY2NeBvfTbjbc8AP0Uf2ml0bdUw7TmeHEusjIeGUXxDYxQ/7wCbU/0qrWZ2bGwQXbNcBrjn/YAlNu4+jcqaOY/EepTcjpIZ6ReM6gkLyzLrxBilhAWkg45/4dFhXefZCALlSqFXOgdw8kM24vWwBjFSesaVTe10RkwPJdDetFrFW+dpriS+rO8FYx4nfAns4Wr/8tzfUO3X9TRhk8ZkdZM0DvaBsooUmH7vXxitCXA9/vLhW3C3xvcaGYzkrQbT9pk+qAOJNDBz+N4TB9m2cYOyLj0OCCU+RVWvegcFidVlQmCz1sjY5YJ6K9rZG1EmYliwCzq815rKKYc5hCJNI8c6ZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB5531.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(36092001)(71200400001)(2906002)(76116006)(86362001)(8936002)(66556008)(4326008)(478600001)(64756008)(186003)(66446008)(66946007)(66476007)(52536014)(110136005)(8676002)(7416002)(26005)(316002)(6506007)(54906003)(33656002)(5660300002)(7696005)(9686003)(83380400001)(55016002)(55236004)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: B4q5X7vDRK05uWNMnTI5xqxQkMBtgQh/YJy+B5xdy/ViymNkLv7PTNXV8bdXhUoFd221Ulir/TUrtn5fdQUJWG6baEN88cnkHOO66wxcMeD01HFPZMXxLGh/LwnmGB875Kv0H0UvtTADM4yJhfcw3dKskuwDm1iySNEud7e8je6iOp0IFKawkWOhTTcO/A9oOn87IGxR16mfvuzgvI5NcIEFQv0IUsKJ80Vx9+l8C/D/9pWqvR+RKXLomh8Z+Qdkllaa+sVQBDCxV6Cw9gLsbBe8cub3t10hgN/B1u/Yv8W/JEqufbZJg6clA6uh/V6RkeBcfgMvPCdj68YrhBrJHLvTm9IUDg1jgSDhipBb42lN8oqD3/jxIGcW6/io2WR6zFVbLDTSIiuWqgsFIoOHn7KlTj1pL0lZmZWX8SeFUfvajvVbEaxKppagVa2j8EPbW4yb3QSee79MtR+6cW4KpA2/CWjzbwDeN6Q8wjH91t6unF7QkzRTM/5CbsLh4rf8Sft6QOBLEdLzey2msHJrBWZMInJM4vPUUQzRyviK372EK9mNhlUUMl52j4F148Hymjr9fxc/aQGyYalQZ6mlZ8Ka9T+Rs8LUxNWObaJqABTDE9nD0cl5qNn865dR4vU6efTF4kywVzmr6bjIJ9LYZg==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5531.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1ae9ae-4b0c-48cb-4a7e-08d84fdb79d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 07:32:13.1060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvlcpjfPFH8YBtmedT8vKMms7Y9+zUSZD+MFAfjbKVeBeIeTBN5wuz7O1J+DIIrGB2eSKEoh3iXbVrwY7B+mtq4NW8ZG9MRGH5pFKhbCsHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6363
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-03_04:2020-09-02,
 2020-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009030067
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: "praneeth@ti.com" <praneeth@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>,
 "jsarha@ti.com" <jsarha@ti.com>, Yuti Suresh Amonkar <yamonkar@cadence.com>,
 "nikhil.nd@ti.com" <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

>-----Original Message-----
>From: Tomi Valkeinen <tomi.valkeinen@ti.com>
>Sent: Thursday, September 3, 2020 12:54 PM
>To: Milind Parab <mparab@cadence.com>; Swapnil Kashinath Jakhade
><sjakhade@cadence.com>; airlied@linux.ie; daniel@ffwll.ch;
>Laurent.pinchart@ideasonboard.com; robh+dt@kernel.org;
>a.hajda@samsung.com; narmstrong@baylibre.com; jonas@kwiboo.se;
>jernej.skrabec@siol.net; dri-devel@lists.freedesktop.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
>Cc: Yuti Suresh Amonkar <yamonkar@cadence.com>; jsarha@ti.com;
>nsekhar@ti.com; praneeth@ti.com; nikhil.nd@ti.com
>Subject: Re: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
>DPI/DP bridge
>
>EXTERNAL MAIL
>
>
>Hi Milind,
>
>On 03/09/2020 09:22, Milind Parab wrote:
>
>> Also, note that CDNS MHDP implements DP_FRAMER_TU_p where bits 5:0
>is tu_valid_symbols. So max programmable value is 63.
>> Register document gives following explanation "Number of valid symbols
>> per Transfer Unit (TU). Rounded down to lower integer value (Allowed
>values are 1 to (TU_size-1)"
>>
>> So, it says in case vs calculates to 64 (where Avail BW and Req BW are
>> same) we program tu_valid_symbols = 63
>
>Hmm, so "Rounded down to lower integer value" means
>
>floor(x) - 1 ?
>
>If that's the case, we need to subtract 1 in all cases, not only when req bw ==
>avail bw.
>
Explicit subtraction by 1 is not mentioned anywhere
There is a hint of sub-optimal performance when vs equals 64. However need to confirm from simulations.

>> Third, is about the line_threshold calculation Unlike TU_SIZE and
>> Valid_Symbols, line_threshold is implementation dependent
>>
>> CDNS MHDP register specs gives the definition as " Video FIFO latency
>threshold"
>> Bits 5:0, Name "cfg_active_line_tresh", Description "Video Fifo Latency
>threshold. Defines the number of FIFO rows before reading starts. This setting
>depends on the transmitted video format and link rate."
>>
>> This parameter is the Threshold of the FIFO. For optimal performance
>(considering equal write and read clock) we normally put the threshold in the
>mid of the FIFO.
>> Hence the reset value is fixed as 32.
>> Since symbol FIFO is accessed by Pxl clock and Symbol Link Clock the
>> Threshold is set to a value which is dependent on the ratio of these
>> clocks
>>
>> line_threshold = full_fifo - fifo_ratio_due_to_clock_diff + 2 where,
>> full_fifo = (vs+1) * (8/bpp) fifo_ratio_due_to_clock_diff = ((vs+1) *
>> pxlclock/mhdp->link.rate - 1) / mhdp->link.num_lanes
>>
>> Note that line_threshold can take a max value of 63
>
>That doesn't result in anything sensible. 8/bpp is always 0.

Consider above statements as pseudocode. For integer division we need scale up like it was scaled by 5 bits in the original code
And here 8/bpp = 1
>
> Tomi
>
>--
>Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
