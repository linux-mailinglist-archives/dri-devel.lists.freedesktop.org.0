Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA669073E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3844A10E1EB;
	Thu,  9 Feb 2023 11:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4D10E1EB;
 Thu,  9 Feb 2023 11:26:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319AeEaH013752; Thu, 9 Feb 2023 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=qcppdkim1;
 bh=pMrPTlIjBPVWsAYd9KrtrSop80r1Lp2/j26ftjP32HA=;
 b=UDddhQ09Az7MBQRYMeKuexYbjgx4UNGpKLqZ9CCWFAYt2560Dkq+6+mlDjBD/cLDmiEj
 Dr5To9fveKPeN+xl0/qTuB1y00h8Pmss+rT+e3kEOXrkkhiekaCW896L/EEooCm7mMwR
 a1AbQzXHNGFYn/J7fy99RrPuvcsLnrOfvicNyZfI2JcuhE2LlbIU3WhlQEcKOpCpAl0X
 0t47HHyxyqpI8Ih4vsF5m3oXcjT3zAX+VeuqOxFPvQCaRkcoRBXpjfaA9DTLW5yS7P20
 a8E13wXfQbTvfezB2o8OJJ7h0As4CArOvi4Pi1LznRHBj0z4PVOUzCB+5zmAvnBheYFi 5Q== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nmpte15x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 11:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2+xeEQQeQt130Y6EvOAhh/FqK9poty6yF0gjnPNqPALIgUJQT/f8+V33h6Kx9m0gM7DsJJMpdQTYl25XcVdP6x9BPsaHlapVXD+DqzKL0y9w1rjFUfvLj1r9PtaLkohUtYT8SqEdN/qZJedS1Tcf0yTsbKaI6lOCdjybwP1RF05Nh1yISTwim+XeLmHIZScjGKrNVBVxzWVxLH1iDmPxQVXtFn5vYqvC+yCg67B3f7KjaWBWd/qWno6h242MG6RTbtqGg4oyqTMbT8IcM7vZ7FJPd3NkkQ5UbyWCxREtXfr0k/Pfoe9EOBat1HXGQwynxXGqdoS4y+9O8aUQQwQUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMrPTlIjBPVWsAYd9KrtrSop80r1Lp2/j26ftjP32HA=;
 b=FQaMgSNeeY4he8QurE6z0ik7LtMjU9XDb+YA7BTELohf9v+p+IZMzs0o40dScSDIdgZqFQWAB2RtxTVbWbZURXk3RhV05AbV3RU7AZp9kH3iuRK66a1dOUq0SyYS7V05h4hvkYL0ESkfMmG3tTIizNbEXh+WYuhNA9cT4fx6RCvrVx6unBLXXMchnze21GszFMGs6zm325Myw4xdFRKkXmahnlMgPmrhOJFT7rfkdIx7WM1q973fikOrthN/+Jev1gtfEXrg+KSZgITGzRpgzpSwi/U0p7pVKHfHIlJRwYLPBbp4/3EJoiJv9KDcJ1AGinOE7ZOoDPra6vYWYJWGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by CO1PR02MB8362.namprd02.prod.outlook.com (2603:10b6:303:151::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Thu, 9 Feb
 2023 11:26:00 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::e9e3:11bd:9ddd:e198]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::e9e3:11bd:9ddd:e198%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 11:26:00 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Subject: RE: [PATCH v3 0/4] Reserve DSPPs based on user request
Thread-Topic: [PATCH v3 0/4] Reserve DSPPs based on user request
Thread-Index: AQHZO8MvBZ22uu2IEE2YKKYZ3iP3aK7FSd2AgAC4yECAAEbRkA==
Date: Thu, 9 Feb 2023 11:26:00 +0000
Message-ID: <BN0PR02MB81426F878B10DDF4AD2F95A896D99@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
 <BN0PR02MB8142207261497BE76A6EA07096D99@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8142207261497BE76A6EA07096D99@BN0PR02MB8142.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|CO1PR02MB8362:EE_
x-ms-office365-filtering-correlation-id: 2a65e934-db75-4578-2714-08db0a906be1
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KEQyWjXV3APc3/nrJQlEw30ki9KPu5QvL0nZ7VjXTvzLH4glalmTjInC+mne64psr2kFiGmt8zkcVzWkcsAB12BT8O44QXJ6KiVdDOqSHcj8eHTfiXTGrTPzekbbpkjrvUkYRzXy404D5Ng0Igi9kquT1F9FL+XYrBpX3HwCNBgxY3VTkk/5KTM03aVboxq5rPIwYMQh1d8iywPyca816ekpkXNLJo/hDOsRJLgACOYv3mx8XA8nde8EON1TzmJ1ACWKEJ77AQTvxxs1ooXCjqyuYLyklw7rd/ziYNa7tqzrkUAsBxP2rnAPLiPUF1MPGH6MVS9cwS5Ata2oWQ2vA5fkF3Y1/HyNRuEIBBxsZj+qyUsRLRJGupoN697FXsTJsYKeEiIVOFCoZ2a25CuUwIoaQbF4PFCQRhKdfI+a+xE5Gcg+B9aAHSj/2uAqlZEP64j30+ogSyX5rILHj1miZAewExUV0onEyMy4nfjLHnZaDmSpeoTKcy7daZd3cgW6G3FLrhDtSYtrrdO53ab6gdgFnp3+piT4+9CGqratcqPQkKn5cvkiYJFX9XXNSFTpX4TODRZjg7vOMA0Gmy5Iox4UIeE9EW69g1QaeOw/99i3QYhpHpyuJbUMMVCcDQh1p1NxitQjefS8QBHeR8Lujfa6Mc0vk2zE/Iw8OmHq1wRB2Y/JfQznMcxLAve0bLy6vYdeFDW5PjUgFUdcWL24GB9ONMfw5rAbbuOWJJHXkEc0elklvJfhYJXbrMLQ6GTMwk2OKOrcSwKmXNNvzHDZUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199018)(2906002)(66446008)(38070700005)(966005)(7416002)(5660300002)(122000001)(38100700002)(99936003)(71200400001)(7696005)(2940100002)(86362001)(66574015)(33656002)(478600001)(6506007)(26005)(9686003)(6916009)(55016003)(64756008)(66476007)(8676002)(66556008)(76116006)(66946007)(52536014)(8936002)(41300700001)(4326008)(83380400001)(316002)(186003)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2ptSlRpOGRjb29qUEcwcGhXQzRTYzMyWkcvQlVKYmlaRllRVUV4azlkQWpj?=
 =?utf-8?B?cjlYMldZT29qM2F3aTN5eDArRXVPODBWVmNKejdtalRCUE81ZHhubjZNYUNL?=
 =?utf-8?B?TkdWeDZjbGVTU05iNDlteVNUa0pubFVsbjlkakN3S2hyMlVPc040VFdlKzU0?=
 =?utf-8?B?dG1LUXNUMi9zK0N3Q1czNXdJRTZ0VW96YXpWWStJaFFYOTlZaUFYczg0MTlR?=
 =?utf-8?B?NlZWTDB3SG5KRU9iaVAzRTRqQjVtK0hLWWJxbmhybnNSRndPdVdhSTBFOGo1?=
 =?utf-8?B?STJmQjg1Y3RhTmxXVEVXcEcxandjNVRzZ0E0a2FJMjA5cTRmM0xWZ0JNWldW?=
 =?utf-8?B?WHpmMDlyNmx2TWJ5QVB6Y0xJTDMvclhSN1ozMDlhbWQ2OEFxdjFmRDhsbXA3?=
 =?utf-8?B?QVZnWlNFdEFBRE1XREFPYnEyVlg2Y2kyQlQ2dFU5V2ZnSU5BVDNaTzNRZ1BH?=
 =?utf-8?B?a3RYYm5uVm1uVzh4ck5RbnN0a1ExNjREV1luYzZXT0poVUk4SmdYeHdGYnhX?=
 =?utf-8?B?Q0R6NGtmT283RFB0TnZhSWVhdHYrdTZSSzZldFIxY2dwaCtmbEpLcEJkK3VK?=
 =?utf-8?B?VVJpalhUV0RLc1NjVDY0ZHRhRkkzb1M1QmFpMmZnSUxxVUxFUmZHY3NnQnBD?=
 =?utf-8?B?RjBnR25sMzFaMW9VbXI0N3ljdTB3R29DZ1NsZnlNbmhsMGwzOVFyREQwZ1Vx?=
 =?utf-8?B?YkhjTHJzMWJCYkJQNC9jbkRnYTA2WElsdDV5c1QrNENIUnViZUhZSngxbmhs?=
 =?utf-8?B?NTEvUVNBZHQ0Qmw5MTdxTk9xVWVrZGZTcmtzckowOVVWek9OblZOeWtmdnJr?=
 =?utf-8?B?dWpaeEJ0eHZyZVpkQTZtTWhZRENUVWdxLzJMZ0FOaWg2bUk2NU0rV1pSZzJW?=
 =?utf-8?B?UmpiUjBuZWEySFhJamFrcTNDZVppRTA3TlhTYzFBZ3dPMFEybmoyWGxVVS9V?=
 =?utf-8?B?VzJsN01FV3ZiWm1ra0Q1clhkdTFUNEtpcXEyVWlrZFgrUlppd0NKdlpaWGlv?=
 =?utf-8?B?c0Y5QzhUTEpWZ3g5SFkvbVp3eGNpcUtlbnVQbW1SVVc2WWIwVnArVjc1cDRw?=
 =?utf-8?B?U2pBNjhqY25INUc5OVpodkxJdXVWVll4djBFdFFjcmgrMDY2a3NONnB5NmNB?=
 =?utf-8?B?UlBNK2ZQdjV0dmVXaFYzWkl6OUw3SzZHeklPdk5PbnRMbG1qdnZHcUJMQUE5?=
 =?utf-8?B?NXR5VGc3WHNINnlTR1QvZ0VBZTBvdHN1WmNZNnZxN2VyZDFGd0RrVnNTUXR4?=
 =?utf-8?B?TEdYdnVzTndzaWZNOU5UNzcvdXhUNis5YVZCZWhRSHVqdzl1TWFMc3RCUjVx?=
 =?utf-8?B?TzVGZXdvK0txNzRMTkdqalFaT2lJRmxNaGxEZVpYMTdMNUVFcHJKaWlXRTNI?=
 =?utf-8?B?T0RURk9GTElaelZzWlJTWk5uejNUeUp5VG1XVGsrZ1ZOSU41b3hyWWZER1lt?=
 =?utf-8?B?Ync4ZEs2UHdibGdtc3A2SWd0VkI2eXpKcmtMSUwzV0JNNTBwV0RxSlVPNHRw?=
 =?utf-8?B?b0tobzd1ZEY4OWFuMm9LajUxUFBYV1o1VmsxUkE5MHFyTjNkQlcvVDNER3g5?=
 =?utf-8?B?YU1SWDJ5OEZqR0I0Yk91d3V0RlFieTl2MVRxOE9qNnB2Zm0vZUZOY083TVRr?=
 =?utf-8?B?YjlqUjYrWW9WRXk1SzhkVzFjR3Z6aDMwbDA3Vkt5cEhoZ256cTlsdmZ5QzVX?=
 =?utf-8?B?d05vMWRHaFc5WmJ5RmxMby9xNXgyVThQUDEyV2RGVmNoV3R6b3Q1ZDRrOFpK?=
 =?utf-8?B?MHpQZjZ2Mjk4V3Foa2RSR1NpWUw5YzU2VTJPOURESEdGY1QrUGZXK0NMV2JY?=
 =?utf-8?B?Y1pVQkhNN1BuNllXNFdQbkhxMVlYWnZ4aWlnRDNHbldKeGxNUFU0OTVtbUhn?=
 =?utf-8?B?RXVzdXBKUS8zSi9PYVlwVXFtZW5lUjc5TlV3KzIrVHNZcjFMSEtLUzV3aGRY?=
 =?utf-8?B?MGxwOG9lVEFEU010cTBSamk5TU04eS8vYzlIWWlHWE1PbzlxVFF6SUtSTTI1?=
 =?utf-8?B?VTQ3eERJWG13ZW5OTDhrUnltSlIvc2NoajB6Mjh1bkxMRll5aDNYQzFDSWNY?=
 =?utf-8?B?WFBwQ3ZlNTFNcVFTQXAwN005Y0RSU3JEbzFWaHA1NUlNa0o1aDF6dXRnZFc3?=
 =?utf-8?Q?45ECCfwVm1v7vZPUngs0k7+gv?=
Content-Type: multipart/mixed;
 boundary="_002_BN0PR02MB81426F878B10DDF4AD2F95A896D99BN0PR02MB8142namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?UHVqTDJmUXB6QlZnbWt5U0k2VnYxQ01FZytZUGlZU0t1d0l0a0Q0YW9GWnJi?=
 =?utf-8?B?d3dkbVdiemtIYXVRN0wraG51TGlCY2xIM1o3UkE3YVpLZFpYRStuK0JWWUJQ?=
 =?utf-8?B?M3NzMXZ6bGM0YnlUZ0tNVEhqdjdueCs1b2ZVaXZhdW13TjJPNDRqNE83Wnhz?=
 =?utf-8?B?WWhuMUd5Mi9HTHRKeHlqSkcwNUplNGRJS3QwMjNLQ0dpNUgzOFRaNXdPeUU0?=
 =?utf-8?B?bDNmZHZJbzZsTmZlZm1GSHpyb2JQa3BsVE43WWx6N3BYYnVtQ1U1ZHpyaHpE?=
 =?utf-8?B?RW9Ud1FCQ29idGRGTVpBdHI4eERaMzNlMzhmem5HM0Q1MyswMUpEWUxGZHlH?=
 =?utf-8?B?VGhzTEVFWlR5bVUxOGtkdmhrMTc3S25MZEowMDc4S1A1SFFrS2Z5Y3paa3Ru?=
 =?utf-8?B?QkVnRU1kTjVqTHZNZENCeTg2aDI2bjVQOEtOeTZBYlkxbDhoWkl0WGFtbTJp?=
 =?utf-8?B?Y09MOUFUSHF4UktXUGt5V0YveW1Ba3Y3NTlWR0h1Ni9Lb21oTVhkbXc4bzVC?=
 =?utf-8?B?bVVyeTVabzBOUnN0bUwyU0ZnTE4zbXBiNlVLNVdWUk4yS2hFc0RIKzlyVlNL?=
 =?utf-8?B?N2N1c0xrL3g2QUdzVFdYOW80TlRLWTJlZ3pRRXlCK1gzT28zaDM4SkhzNy9S?=
 =?utf-8?B?YkE2Y3c4UFpSZW9nWVk4Ky9qSXlZL0hVUzREd2xrRE9rOWg5U3A2Ni9yMUZv?=
 =?utf-8?B?RUVOYnIrVjlEQVliakxLUjJRSXB2YXVONEZyMWtlcDBaTzJOd0FTTURsK0Zj?=
 =?utf-8?B?eDZKbzNsQlJtbEd5N2lPcXRKMlJGUUM5azhuMm9WckpDUVF1WmF6bEVNMFpU?=
 =?utf-8?B?TVRBMkx0S1BTdDh2L2t2WjROcVdZekw5N1pKUzJ1MlQ5d1pXMkpxVUFuMEtz?=
 =?utf-8?B?UitiVzBhYVRIWlBUenZCOUF2ZkwvQ1FZQnJvRE1yampnN1FHelJ1dDVJTmZh?=
 =?utf-8?B?biswdFV5bitDd24vdXNVa1FxWCtaalNPT0d1MXVRdGE3VkVWRXBlVmRCSk5W?=
 =?utf-8?B?ekJnYmxJdVlMc3lHWE9IZzFpUmI3TmZNZWUwQjNCaDlTNFpWT04xL2k2L09l?=
 =?utf-8?B?V2NvVHhQRjlSUG1XeW43WmhjK0ZSVFN1VWJLSXN2dkl5QTVNdUhBNWRiTGRM?=
 =?utf-8?B?OGsycEVYcGd3Wlh5cjdXRFJiandEY1laK0VFZDVrNkcrVitaWExhbE5mekFx?=
 =?utf-8?B?dTFpYUNDRWdhYnBJMTFmeHpZaWdaQ1JMVHlHQnJTZUtDNEhyUkFSSVl1RHNJ?=
 =?utf-8?Q?lKJlDfsXtoTwn2D?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a65e934-db75-4578-2714-08db0a906be1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 11:26:00.4074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvZqV62li8yBiMdLOaENWoTy0sygU6VL6gAwxwZMgmtcrRMT8x/XY6y7VzFttzI6n2NBrAf4PGMCdB2XeV2b15UiH9rnAn+B4Tald+JlkRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8362
X-Proofpoint-GUID: waSOA7AMb_nbq64I_LN2UJn44sNtam7x
X-Proofpoint-ORIG-GUID: waSOA7AMb_nbq64I_LN2UJn44sNtam7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_07,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090109
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Abhinav Kumar
 \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_002_BN0PR02MB81426F878B10DDF4AD2F95A896D99BN0PR02MB8142namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

S2luZGx5IGlnbm9yZSBteSBwcmV2aW91cyBlbWFpbC4gU2VudCB0b28gZWFybHkgISENCg0KV2Ug
aGF2ZSB0ZXN0ZWQgdGhlIGNoYW5nZXMgb24gdG9wIG9mIHRpcDogaHR0cHM6Ly9jaHJvbWl1bS5n
b29nbGVzb3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsLytsb2cvcmVmcy9o
ZWFkcy9jaHJvbWVvcy01LjE1ICsgNSBDVE0gcGF0Y2hlcyAoIHRoYXQgeW91IGhhdmUgcXVvdGVk
ICkNCldlIGRpZG7igJl0IHNlZSB0aGUgaXNzdWUgdGhhdCB5b3UgaGF2ZSByZXBvcnRlZCBvbiBo
ZXJvYnJpbmUuIE5pZ2h0IGxpZ2h0IGFsd2F5cyBjYW1lIHVwIG9uIHByaW1hcnkgZGlzcGxheSBh
cyB0aGUgcmVzZXJ2YXRpb24gd2l0aCBkc3BwIHdhcyBzdWNjZXNzZnVsLiAgQXJlIHlvdSBzZWVp
bmcgYW55IHJlc2VydmF0aW9uIGZhaWx1cmVzIGZvciBwcmltYXJ5IGRpc3BsYXkgPw0KDQpBdHRh
Y2hlZCBhIGRlYnVnIHBhdGNoLCBjYW4geW91IHNoYXJlIHRoZSBsb2dzIHdoZW4geW91IHNlZSB0
aGUgaXNzdWUuDQoNClRoYW5rcywNCkthbHlhbg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj5Gcm9tOiBLYWx5YW4gVGhvdGENCj5TZW50OiBUaHVyc2RheSwgRmVicnVhcnkgOSwgMjAy
MyA5OjQ3IEFNDQo+VG86IERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz47IEth
bHlhbiBUaG90YSAoUVVJQykNCj48cXVpY19rYWx5YW50QHF1aWNpbmMuY29tPg0KPkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9y
ZzsNCj5mcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtDQo+a2VybmVsQHZnZXIua2VybmVsLm9yZzsgcm9iZGNsYXJrQGNocm9t
aXVtLm9yZzsgc3dib3lkQGNocm9taXVtLm9yZzsNCj5WaW5vZCBQb2xpbWVyYSAoUVVJQykgPHF1
aWNfdnBvbGltZXJAcXVpY2luYy5jb20+Ow0KPmRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsg
QWJoaW5hdiBLdW1hciAoUVVJQykNCj48cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT47IG1hcmlq
bi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnDQo+U3ViamVjdDogUkU6IFtQQVRDSCB2MyAwLzRdIFJl
c2VydmUgRFNQUHMgYmFzZWQgb24gdXNlciByZXF1ZXN0DQo+DQo+SGkgRG91ZywNCj4NCj5IYXZl
IHlvdSBwaWNrZWQgdGhlIGNvcmUgY2hhbmdlIHRvIHByb2dyYW0gZHNwcCdzICAoYmVsb3cpID8g
dGhlIGN1cnJlbnQgc2VyaWVzDQo+d2lsbCBnbyBvbiB0b3Agb2YgaXQuDQo+aHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1tc20vcGF0Y2gvMTY3MTU0MjcxOS0x
MjY1NS0NCj4xLWdpdC1zZW5kLWVtYWlsLXF1aWNfa2FseWFudEBxdWljaW5jLmNvbS8NCj4NCj5U
aGFua3MsDQo+S2FseWFuDQo+DQo+Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PkZyb206
IERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4NCj4+U2VudDogV2VkbmVzZGF5
LCBGZWJydWFyeSA4LCAyMDIzIDEwOjQ0IFBNDQo+PlRvOiBLYWx5YW4gVGhvdGEgKFFVSUMpIDxx
dWljX2thbHlhbnRAcXVpY2luYy5jb20+DQo+PkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsNCj4+ZnJlZWRyZW5vQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPj5r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAY2hyb21pdW0ub3JnOyBzd2JveWRAY2hy
b21pdW0ub3JnOw0KPj5WaW5vZCBQb2xpbWVyYSAoUVVJQykgPHF1aWNfdnBvbGltZXJAcXVpY2lu
Yy5jb20+Ow0KPj5kbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc7IEFiaGluYXYgS3VtYXIgKFFV
SUMpDQo+PjxxdWljX2FiaGluYXZrQHF1aWNpbmMuY29tPjsgbWFyaWpuLnN1aWp0ZW5Ac29tYWlu
bGluZS5vcmcNCj4+U3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzRdIFJlc2VydmUgRFNQUHMgYmFz
ZWQgb24gdXNlciByZXF1ZXN0DQo+Pg0KPj5XQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQg
ZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPj5vZiBhbnkgbGlua3Mg
b3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4+DQo+PkhpLA0KPj4N
Cj4+T24gV2VkLCBGZWIgOCwgMjAyMyBhdCA1OjQyIEFNIEthbHlhbiBUaG90YSA8cXVpY19rYWx5
YW50QHF1aWNpbmMuY29tPg0KPj53cm90ZToNCj4+Pg0KPj4+IFRoaXMgc2VyaWVzIHdpbGwgZW5h
YmxlIGNvbG9yIGZlYXR1cmVzIG9uIHNjNzI4MCB0YXJnZXQgd2hpY2ggaGFzDQo+Pj4gcHJpbWFy
eSBwYW5lbCBhcyBlRFANCj4+Pg0KPj4+IFRoZSBzZXJpZXMgcmVtb3ZlcyBEU1BQIGFsbG9jYXRp
b24gYmFzZWQgb24gZW5jb2RlciB0eXBlIGFuZCBhbGxvd3MNCj4+PiB0aGUgRFNQUCByZXNlcnZh
dGlvbiBiYXNlZCBvbiB1c2VyIHJlcXVlc3QgdmlhIENUTS4NCj4+Pg0KPj4+IFRoZSBzZXJpZXMg
d2lsbCByZWxlYXNlL3Jlc2VydmUgdGhlIGRwdSByZXNvdXJjZXMgd2hlbiBldmVyIHRoZXJlIGlz
DQo+Pj4gYSB0b3BvbG9neSBjaGFuZ2UgdG8gc3VpdCB0aGUgbmV3IHJlcXVpcmVtZW50cy4NCj4+
Pg0KPj4+IEthbHlhbiBUaG90YSAoNCk6DQo+Pj4gICBkcm0vbXNtL2RwdTogY2xlYXIgRFNQUCBy
ZXNlcnZhdGlvbnMgaW4gcm0gcmVsZWFzZQ0KPj4+ICAgZHJtL21zbS9kcHU6IGFkZCBEU1BQcyBp
bnRvIHJlc2VydmF0aW9uIHVwb24gYSBDVE0gcmVxdWVzdA0KPj4+ICAgZHJtL21zbS9kcHU6IGF2
b2lkIHVubmVjZXNzYXJ5IGNoZWNrIGluIERQVSByZXNlcnZhdGlvbnMNCj4+PiAgIGRybS9tc20v
ZHB1OiByZXNlcnZlIHRoZSByZXNvdXJjZXMgb24gdG9wb2xvZ3kgY2hhbmdlDQo+Pj4NCj4+PiAg
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuaCAgICB8ICAyICsNCj4+PiAg
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyB8IDU4DQo+Pj4gKysr
KysrKysrKysrKysrKy0tLS0tLQ0KPj4tLS0tLS0tDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9ybS5jICAgICAgfCAgMiArDQo+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMzcg
aW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+Pg0KPj5JIHRyaWVkIG91dCB5b3VyIGNo
YW5nZXMsIGJ1dCB1bmZvcnR1bmF0ZWx5IGl0IHNlZW1zIGxpa2UgdGhlcmUncyBzb21ldGhpbmcN
Cj53cm9uZy4NCj4+OiggSSBkaWQgdGhpczoNCj4+DQo+PjEuIFBpY2tlZCB5b3VyIDUgcGF0Y2hl
cyB0byB0aGUgY2hyb21lb3MtNS4xNSB0cmVlICh0aGlzIHNlcmllcyBwbHVzDQo+PlsxXSkNCj4+
DQo+PjIuIFB1dCB0aGVtIG9uIGhlcm9icmluZSB2aWxsYWdlci4NCj4+DQo+PjMuIEJvb3RlZCB1
cCB3aXRoIG5vIGV4dGVybmFsIGRpc3BsYXkgcGx1Z2dlZCBpbi4NCj4+DQo+PjQuIFRyaWVkIHRv
IGVuYWJsZSBuaWdodCBsaWdodCBpbiB0aGUgQ2hyb21lT1MgVUkuDQo+Pg0KPj41LiBOaWdodCBs
aWdodCBkaWRuJ3QgdHVybiBvbiBmb3IgdGhlIGludGVybmFsIGRpc3BsYXkuDQo+Pg0KPj4NCj4+
SSBhbHNvIHRyaWVkIGFwcGx5aW5nIHRoZW0gdG8gdGhlIHRvcCBvZiBtc20tbmV4dCAoaGFkIHRv
IHJlc29sdmUgc29tZQ0KPj5zbWFsbCBjb25mbGljdHMpLiBTYW1lIHRoaW5nLCBuaWdodCBsaWdo
dCBkaWRuJ3Qgd29yay4NCj4+DQo+Pg0KPj5JIHRob3VnaHQgbWF5YmUgdGhpcyB3YXMgYmVjYXVz
ZSB0aGUgQ2hyb21lIGJyb3dzZXIgaGFzbid0IGJlZW4gdXBkYXRlZA0KPj50byBwcm9wZXJseSB1
c2UgYXRvbWljX2NoZWNrIGZvciB0ZXN0aW5nIGZvciBuaWdodCBsaWdodCwgc28gSSBoYWNrZWQN
Cj4+bXkgaGVyb2JyaW5lIGRldmljZSB0cmVlIHRvIG5vdCBtYXJrICJtZHNzX2RwIiBhcyAib2th
eSIuIE5vdyB0aGVyZSdzIF9vbmx5Xw0KPmFuIGVEUCBkaXNwbGF5Lg0KPj5TYW1lIHRoaW5nLCBu
aWdodCBsaWdodCBkaWRuJ3Qgd29yay4NCj4+DQo+Pg0KPj5JIGNvdWxkIG9ubHkgZ2V0IG5pZ2h0
IGxpZ2h0IHRvIHdvcmsgZm9yIHRoZSBpbnRlcm5hbCBkaXNwbGF5IGlmIEkNCj4+cGx1Z2dlZCBh
bmQgdW5wbHVnZ2VkIGFuIGV4dGVybmFsIGRpc3BsYXkgaW4uDQo+Pg0KPj4NCj4+SXMgdGhlIGFi
b3ZlIHRoZSBiZWhhdmlvciB0aGF0J3MgZXhwZWN0ZWQgcmlnaHQgbm93Pw0KPj4NCj4+DQo+Plsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMTY3NDgxNDQ4Ny0yMTEyLTEtZ2l0LXNlbmQt
ZW1haWwtDQo+PnF1aWNfa2FseWFudEBxdWljaW5jLmNvbS8NCg==

--_002_BN0PR02MB81426F878B10DDF4AD2F95A896D99BN0PR02MB8142namp_
Content-Type: application/octet-stream; name="nightlight_debug.patch"
Content-Description: nightlight_debug.patch
Content-Disposition: attachment; filename="nightlight_debug.patch"; size=2945;
	creation-date="Thu, 09 Feb 2023 11:25:10 GMT";
	modification-date="Thu, 09 Feb 2023 11:25:59 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCmluZGV4IDM2YmRjYWEuLmEy
NDc2NDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRj
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwpAQCAtNzYy
LDYgKzc2Miw3IEBAIHN0YXRpYyB2b2lkIF9kcHVfY3J0Y19zZXR1cF9jcF9ibG9ja3Moc3RydWN0
IGRybV9jcnRjICpjcnRjKQogCQkJZHNwcC0+b3BzLnNldHVwX3BjYyhkc3BwLCBOVUxMKTsKIAkJ
fSBlbHNlIHsKIAkJCV9kcHVfY3J0Y19nZXRfcGNjX2NvZWZmKHN0YXRlLCAmY2ZnKTsKKwkJCXBy
X2VycigiXG4iKTsKIAkJCWRzcHAtPm9wcy5zZXR1cF9wY2MoZHNwcCwgJmNmZyk7CiAJCX0KIApk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKaW5kZXggMDM4ZTA3
Ny4uNGJhN2VlOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rl
ci5jCkBAIC0yMjEsNyArMjIxLDcgQEAgc3RhdGljIGJvb2wgX2RwdV9lbmNfaXNfZHNwcF9jaGFu
Z2VkKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKIAlzdHJ1Y3QgbXNtX2Rpc3Bs
YXlfdG9wb2xvZ3kgdG9wb2xvZ3kpCiB7CiAJc3RydWN0IGRwdV9jcnRjX3N0YXRlICpjc3RhdGUg
PSB0b19kcHVfY3J0Y19zdGF0ZShjcnRjX3N0YXRlKTsKLQorCXByX2VycigiY3N0YXRlIGN0bSBl
bmFibGUgOiVkIHRvcGxvZ3kgZHNwcG51bTolZFxuIiwgY3N0YXRlLT5jdG1fZW5hYmxlZCwgdG9w
b2xvZ3kubnVtX2RzcHApOwogCWlmICgoY3N0YXRlLT5jdG1fZW5hYmxlZCAmJiAhdG9wb2xvZ3ku
bnVtX2RzcHApIHx8CiAJICAgICghY3N0YXRlLT5jdG1fZW5hYmxlZCAmJiB0b3BvbG9neS5udW1f
ZHNwcCkpIHsKIAkJY3J0Y19zdGF0ZS0+bW9kZV9jaGFuZ2VkID0gdHJ1ZTsKQEAgLTYwMyw3ICs2
MDMsNyBAQCBzdGF0aWMgc3RydWN0IG1zbV9kaXNwbGF5X3RvcG9sb2d5IGRwdV9lbmNvZGVyX2dl
dF90b3BvbG9neSgKIAkJdG9wb2xvZ3kubnVtX2ludGYgPSAxOwogCQl0b3BvbG9neS5udW1fbG0g
PSAyOwogCX0KLQorCXByX2VycigiY3RtIDogJXAgdG9wb2xvZ3kgbnVtX2RzcHA6ICVkIHRvcG9s
b2d5IG51bV9sbTolZFxuIixjcnRjX3N0YXRlLT5jdG0sIHRvcG9sb2d5Lm51bV9kc3BwLCB0b3Bv
bG9neS5udW1fbG0pOwogCXJldHVybiB0b3BvbG9neTsKIH0KIApAQCAtNjI2LDcgKzYyNiw3IEBA
IHN0YXRpYyBpbnQgZHB1X2VuY29kZXJfdmlydF9hdG9taWNfY2hlY2soCiAJCQkJZHJtX2VuYyAh
PSBOVUxMLCBjcnRjX3N0YXRlICE9IE5VTEwsIGNvbm5fc3RhdGUgIT0gTlVMTCk7CiAJCXJldHVy
biAtRUlOVkFMOwogCX0KLQorCXByX2VycigiXG4iKTsKIAlkcHVfZW5jID0gdG9fZHB1X2VuY29k
ZXJfdmlydChkcm1fZW5jKTsKIAlEUFVfREVCVUdfRU5DKGRwdV9lbmMsICJcbiIpOwogCkBAIC02
NTcsMTIgKzY1NywxMyBAQCBzdGF0aWMgaW50IGRwdV9lbmNvZGVyX3ZpcnRfYXRvbWljX2NoZWNr
KAogCiAJX2RwdV9lbmNfaXNfZHNwcF9jaGFuZ2VkKGNydGNfc3RhdGUsIHRvcG9sb2d5KTsKIAor
CXByX2VycigiY3J0YyBzdGF0ZSBlbmFibGU6JWQgbmVlZHNfbW9kZXNldDogJWRcbiIsIGNydGNf
c3RhdGUtPmVuYWJsZSwgZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoY3J0Y19zdGF0ZSkp
OworCiAJLyoKIAkgKiBSZWxlYXNlIGFuZCBBbGxvY2F0ZSByZXNvdXJjZXMgb24gZXZlcnkgbW9k
ZXNldAogCSAqLwogCWlmIChkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0YXRl
KSkgewogCQlkcHVfcm1fcmVsZWFzZShnbG9iYWxfc3RhdGUsIGRybV9lbmMpOwotCiAJCWlmIChj
cnRjX3N0YXRlLT5lbmFibGUpCiAJCQlyZXQgPSBkcHVfcm1fcmVzZXJ2ZSgmZHB1X2ttcy0+cm0s
IGdsb2JhbF9zdGF0ZSwKIAkJCQkJZHJtX2VuYywgY3J0Y19zdGF0ZSwgdG9wb2xvZ3kpOwpAQCAt
MTA5OSw2ICsxMTAwLDcgQEAgc3RhdGljIHZvaWQgZHB1X2VuY29kZXJfdmlydF9hdG9taWNfbW9k
ZV9zZXQoc3RydWN0IGRybV9lbmNvZGVyICpkcm1fZW5jLAogCiAJY3N0YXRlLT5udW1fbWl4ZXJz
ID0gbnVtX2xtOwogCWNzdGF0ZS0+Y3RtX2VuYWJsZWQgPSAhIW51bV9kc3BwOworCXByX2Vycigi
Y3RtX2VuYWJsZWQ6ICVkXG4iLCBjc3RhdGUtPmN0bV9lbmFibGVkKTsKIAlkcHVfZW5jLT5jb25u
ZWN0b3IgPSBjb25uX3N0YXRlLT5jb25uZWN0b3I7CiAKIAlmb3IgKGkgPSAwOyBpIDwgZHB1X2Vu
Yy0+bnVtX3BoeXNfZW5jczsgaSsrKSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9y
bS5jCmluZGV4IDcxOGVhMGEuLmEwZTI0OTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9ybS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9ybS5jCkBAIC00MjgsNiArNDI4LDcgQEAgc3RhdGljIGludCBfZHB1X3JtX3Jlc2VydmVf
bG1zKHN0cnVjdCBkcHVfcm0gKnJtLAogCiAJCXRyYWNlX2RwdV9ybV9yZXNlcnZlX2xtcyhsbV9p
ZHhbaV0gKyBMTV8wLCBlbmNfaWQsCiAJCQkJCSBwcF9pZHhbaV0gKyBQSU5HUE9OR18wKTsKKwkJ
cHJfZXJyKCJlbmNpZCA6ICVkICBlbmNfdG9fZHNwcGlkIDogJWRcbiIsIGVuY19pZCwgcmVxcy0+
dG9wb2xvZ3kubnVtX2RzcHApOwogCX0KIAogCXJldHVybiAwOwo=

--_002_BN0PR02MB81426F878B10DDF4AD2F95A896D99BN0PR02MB8142namp_--
