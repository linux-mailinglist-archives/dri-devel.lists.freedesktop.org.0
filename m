Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA5C68FE52
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 05:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6D910E8EA;
	Thu,  9 Feb 2023 04:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DB910E1F0;
 Thu,  9 Feb 2023 04:16:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3194G9Cp014435; Thu, 9 Feb 2023 04:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=o0hYrHzklalkFtHfRtqgEJj1skKCxDTGXSTX3f1Wgi0=;
 b=Jk0vmq7bo85DR3r6fV0PkvZ/dWIkKLIJBYFwzUevJqxC3bVOyBwmWeAyoaRbEfTyzU4V
 cYzQAS0O1kW8xkhXa7KVA2fNPLVnCOzSZFpCNtNo8tjjjYWTqPjjAoYdHVADs2CA76F3
 Z4awM0JOsqaQ0813dfOQMkd1dmk7RECPJZPR2dVGxlu+gOWtutrah2XVL0NSfNGS+alA
 ZCfOMNcTzvdyv3Qz+9AG3pFXMyaUUpTAU9EjGzUuYqpFcrAE2EayMAQDB60aSlKlqnVC
 1XcPb3TqvOGVtZiCoNdI5iD/DrLOi7sGJd6SxbAO9TseeIlnwripk2VbW8fYoA7sgL8D GQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm86mtjhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 04:16:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWZezXV6/qJ62AoCFTKYLByOv5CdnL96yfS1AmxQB3N19vP1rV968Jb+/pbcxTUnWawYqmb/v8wNMJeVUPU3ZaOHE5OGYU6UCFJ0EXTL5dlIloBfe9rpksV3HoElEUSJeVkPaxe4RI6cODTd+Rt6ShaO8/Dnnkqy979Q7Eu6FhEeVqZoS0uA5qj1GhvaOG//rbPn5lILn0HDslBU0u5clXN5bNvByeO6SE0No2eL5DGv1+Ji9CVpDEHPnChTuJm7HR9kJK4Z+THUl50WM08N03IHiCR9EB8agwrhgtOpXD8j7eEtHFBs3+MRShHPA8Ofqcdh2F2F85hGrR2Mrl+zKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0hYrHzklalkFtHfRtqgEJj1skKCxDTGXSTX3f1Wgi0=;
 b=GyHVTkSDXMYtxCwmYYL/EqPEWi51MCGA1fMz/obus1vO3iD7Uv8wvGby85KqROTbO6W+RY65JyXyc04quPCa0aETHvRaxiNiIOp/lNFTNBKp58J/FeQwZilIbxbLp07OwiqVqDgxDkJ5ubrruuxBU8/+actpCTTVRj0o5gDOHyCrnaNWH3Zfvtp4z1OVd0cf3X5TJDFi2ktS6pXhdjoAuB+XnRBQnJ2rlRagP62BjUe5X9bopzQAkZoIvtBsSDWMqRFgQbRl+7M30uwZxzpLuBdAppVqDy+to2I3IFxinqKLzw+oMWYo5LErwWN83o4iTZZDGKbJOcYvF6WgZCFqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by CY5PR02MB8992.namprd02.prod.outlook.com (2603:10b6:930:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 04:16:41 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::e9e3:11bd:9ddd:e198]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::e9e3:11bd:9ddd:e198%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 04:16:41 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>, "Kalyan Thota (QUIC)"
 <quic_kalyant@quicinc.com>
Subject: RE: [PATCH v3 0/4] Reserve DSPPs based on user request
Thread-Topic: [PATCH v3 0/4] Reserve DSPPs based on user request
Thread-Index: AQHZO8MvBZ22uu2IEE2YKKYZ3iP3aK7FSd2AgAC4yEA=
Date: Thu, 9 Feb 2023 04:16:41 +0000
Message-ID: <BN0PR02MB8142207261497BE76A6EA07096D99@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
In-Reply-To: <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|CY5PR02MB8992:EE_
x-ms-office365-filtering-correlation-id: ce7e3193-0a68-4eff-5f87-08db0a54726a
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ns/jDasZchYkjwwTBOsPIoF1eqF4uSISENOJu1OuRL9cbXPGgGBFokRKjZDoZKEZGE6gzFMthIHJ1Yq4MqfmaQtB5blPvLS4bZB+FkbV5NpWqVmhBcmuiFLyVFpwDxVt2r0VgncT7qsIiC9+AoKigQ8MjPhkVhajjxC8GESyPnTaCM16+hBtxuHiC3p8rEmzwJCzS7Y4rMguvY51WbBZ0szE3E8+9X7WnYt4rQ7pyNhcasYjhEsxCSqkQsVspdUkvXX/rp+tD7fvxIiRG7cmwc7a20SKUQmC7yAldZnSo2AYnYTx3I1rX2VevfBchdX9dDKIH96mAHxMU0tJ8XMk5a8yMbIJJNN28JkV2kIyxu+QCJPadn/Z1bgSbsA5hS9cgN0FnEO8R+PdwnU9rwTN4RgZEoGhMopv/BOh42WT/VUpcw8jpguh3RBaPhRb6QYfpqsGjXkHgTlbxtHU85BOhIdC2WsVlSpbxuqvpR2h8gdHoATdzTFAQFTbsxtdH+VP6+8yx3+ZuRxxvxi/7Iw3MeGJLOMVpfUl3BwGFFqxTc8oHTH2FipvypY8bWydGgP43uwx5PSe4v/lN4UFQosG61E1oIwEYmXqn+IwDhEAOfR6NJJo/NkVubWe/lE1zQ5cI0zHBJrNT+Y9H/MnHispmtPV4O9Q0PFrLk8b814/skLgeWnQakmlK376kWNeRbM+9+/+3j7kJIt2pxaK/2cIenr167Kc3q6g2fh1BAgnadUGnA3AuzXx8atTRIxE522z7kXQ75vTBfrrCSanjagXDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199018)(66556008)(66476007)(76116006)(66946007)(41300700001)(478600001)(316002)(33656002)(54906003)(66574015)(83380400001)(966005)(38070700005)(38100700002)(7696005)(110136005)(186003)(8676002)(9686003)(86362001)(55016003)(26005)(71200400001)(122000001)(8936002)(52536014)(5660300002)(66446008)(64756008)(2906002)(6506007)(7416002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dno3eVdWdyt5bkx3RU9ENTg2QlNyeE5HcEVjZVVwWXliZzhiZTlLVkpVMDV6?=
 =?utf-8?B?TWRNbnhHaG9SemtGeDBzaWNoamg1c3lnaGgvS3prWExQWlhIS3JnQlNRbmps?=
 =?utf-8?B?Rml3V2o2L0ZvLzdOZ0pPcXpKTkNHQUZpOWlGTVR1L1hXQWMzRlN4b3JxNUhj?=
 =?utf-8?B?MjIzYUNMeHpCUjYvMlJGdFFqOVdmRCtnY3NtLzlqNzdCUzNBQnZLYWMxQTJl?=
 =?utf-8?B?d0JnejNvVW0wUTNZa21iZW9wN3RBUVZsUVFtNXhrRit1Vk9WWkk5MjYyaTRq?=
 =?utf-8?B?ZUgxZHVuZTc5aStseTdDcUxyQTdWc1NGQUduK2IyNUlobldSTGo5THdEVTFk?=
 =?utf-8?B?Qm91bVcxV1BiNnNmajlUak95TVFsNTNiZmZZNXNmblhsNXl0N1NDdDNOenpq?=
 =?utf-8?B?T1hBTEZwNVhJc2xkL2J0VEVoM0lSRCtZNlhmV1VBc3I5Y1dJK2EvU0hYQ3gv?=
 =?utf-8?B?OHhOZVBLNDhHQlBjakcxeDkzVFRQbTdaeVg5RGFMMm1oVHdNNGhmSkViVlUw?=
 =?utf-8?B?bkx5V05IeGJqU2lWLzBrNjFNY1Zid0RtR0xucmZSUzUwa0ZLM042Y25Tbkw5?=
 =?utf-8?B?b0lvWmxZbWhkMmFYcDFYNDk2cEdQYmhocW9pRlZHTW12aUlIdGJBWG45U2hH?=
 =?utf-8?B?bG1IYUdLQnRFZEs3NExzNGpic2hiL3h1U2R1eHRSK2dPc2p2aXdSTTNqMzFQ?=
 =?utf-8?B?eFJWV0dKMkN3Ums5NldlVm9VTWtadXYzU2trb3dyY0RZT3VtQTUweUg4SU15?=
 =?utf-8?B?NWxRQ1poTWNxVkNFRGx0OXA2VlRORjBwOS96dWRYSy9PUHBxUVBmZ2JodzQ0?=
 =?utf-8?B?a3g5aml5V3M4elB4TVNlRjVMY2QzZURZd3ZvSXZwMXFhUXpHaThzd3Q2ZjRB?=
 =?utf-8?B?aUtaNmFJQ0E1SkhoV2VYN0UzSDZ1S2xZRXZRT0NEdEx1b0ZUQVJlOEpCeGlz?=
 =?utf-8?B?TG9hZzQ2TndySDA5WTdUb0N6clBmRmkrWHMzenkwZUdaRkp1OVg2R0kwQ3lE?=
 =?utf-8?B?b3krc2JiOUh4UzFEM2s2SjlvSG16TzdyNWFrRWZyYXZvR0FCNmdPQnVxTXFH?=
 =?utf-8?B?OW9sNHAzQyswc015UVV1cHpkSW9qR0Y5dGdBQTNzdlhFeVkzOWF4TkpCb0kr?=
 =?utf-8?B?Z3ZaY3BvVXF1bDJGSHZvUjlFblJha2RNNlBkNEFJTFFVZVZpdEZyQVIxUmMr?=
 =?utf-8?B?OVBhVE14aElFU3RkUzJvaXdodjhEUFhWNEp0bFp0enhpQ1RIRFk2TElMVHpy?=
 =?utf-8?B?ZVl6azlndE1tQmRwbkUrVFlZZk5hYllhQm5FYUp0YzU0K2RIcnF4LzNuRGNy?=
 =?utf-8?B?eS9NMGcyVkhFMHlUVXB5SmMxM3c4czMxRkM1dzY2d2tBQzRpWm9jTTY3Zkk0?=
 =?utf-8?B?V0ZXVTJsc2dYMWxFRzBTQ24vU0o0ZUhFUG5WSThsS3l0ZllZbGkxUGtjMTRZ?=
 =?utf-8?B?Mkg5N0tmL1JiSDI4YlQ1ZTA3WHA3RTFlYkZJWFVKWXZGQ08zWXZwWGhDaUlZ?=
 =?utf-8?B?RC9MdGMxSUJsSEJ1QTBwczk0YkFzeGVSV1lzNGc0RGhQdTRuOWlFd0RHaGNq?=
 =?utf-8?B?ZGtLT3JWYjFFMDRtZnNzanA3bVovYlo2blJVME1VUlVYVDdrVjNPTGhQanFv?=
 =?utf-8?B?d2F1ZGFxWFVvS3dmVTJsWHl6akFNQ0wyeE10dUVtdHk1b1BxcWRyMkdWb1lY?=
 =?utf-8?B?LzRrK0V6SlRUK3Q5djV3TXpZaFZNUkFIK1ZvUjFQZ3NLaU10YkxmNkRqelYr?=
 =?utf-8?B?elB6OE1VSkt0QUVBT09BNE9IWVEyWDJJNGhuS0JneEFRZ05CQjZReGJndUxi?=
 =?utf-8?B?eVlVZGhLUy84VmNoY05HWm9YZXNick5KRDRYSklhenhVcEVpMnZkakpXVm1F?=
 =?utf-8?B?TlFBUkp3QVowQ0EzemExWGZYUlhGRjJ1bjVzWllmeVBTK29CSGxBMnBUZzJj?=
 =?utf-8?B?K0tYTjh5SmdNQ3QzNm5hU1ZMbTRvMVlMNFZ3Rm5BYzNCTFBJQ0NHRHJ4UXZ0?=
 =?utf-8?B?a1J2TnZldFVreDM1dG83RVUzc1JyeTRSM0x5K2F3U3grS0t3dkplZzQ2ZXhp?=
 =?utf-8?B?TzZza1FwV2l4dTd2N0JmeGVINEVOVTI2QXF0R2Q5T3hoS2QxbUl5R1ZMSUw4?=
 =?utf-8?Q?xsYjfSgjYWE/F8b2gmShrNpcA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?cVRGZG55RlMwVzliL1lhWXJaS0UzZVF2ZFpYTlFKU2I4RERrby9QT0pzR1JJ?=
 =?utf-8?B?R1VlckhYSjNHN3NSRUdySU00US8wa1RNVWRrT3RuRWxsWktnQnRyV2tlalNW?=
 =?utf-8?B?TloxUkx1b0N4Mm5DbG1QK1A0dXJlZ3N5NGxDMi9wd28vMk9VcnI4ajZrbzJp?=
 =?utf-8?B?WFhrY0RrTllUbkhOYzJZU3FZdE55b0Rqd2o5MWp6YkxkN2dFNEdNV0pidkYx?=
 =?utf-8?B?VWFzTGRUTDBIUW12cDYzcS9yV2pWMk90MGZZekhSeEk0blVMdjkyNkViTVl5?=
 =?utf-8?B?VU4rdEJLci9aVGJJODlYcnk0N3EwWGd1VE5ydm5yek85NjZNMlhhWi95Zk5u?=
 =?utf-8?B?NXY2MkZ3VWUycVBCS3gxc2dYdHp3V2E2Zzhsa2Z1ZkIvMThpZ2IvS2ZvKytq?=
 =?utf-8?B?RW45NVgrQjNMTDFXRTNOV25vSDUyVVlxUEo2aVE4dHRER3o3UDEreWkxdHRY?=
 =?utf-8?B?aWdyTkYvRnlENHdQVGUyQVkrSnlTajhYKzkzTHVBdURUbVFwVWtwNGgxelF3?=
 =?utf-8?B?a1phZXJwVnhRMDJXaDlBN0NLeEJXY2VhVFJJY2hOZGI3RklHK1B3bXI1Sklo?=
 =?utf-8?B?L01vQkxPRXVXWlllcGd4NWI0TmRKQ3hCYjlEUHlnYWw0aDNtc0duTTdBeDBz?=
 =?utf-8?B?SSt1YUJ5U2dpZENUbFNiRW9zdVZTYVpWT292Q1hlbWlEYTJBeCtzVE5GTjFo?=
 =?utf-8?B?blRKaEZmd1o5bXB5SUVEMkJtV2NiNWlTR3BTTzFwanlRWlp2Y0RYSE8wMFVx?=
 =?utf-8?B?UVRxMm94T0NMSU9Vbzd4U2FHbElIa1V5Rm0xVVFxU3U4Wis4aGxlR0lodlY5?=
 =?utf-8?B?S0xjaStMdm5adFBwT0pyTlYvakpVM0pPdFVCa1FMWXRabUg0VGR1aUdzMnk0?=
 =?utf-8?B?bHR1TEVlU0NudGVTZ0M2K3psWERkUUtOdzM0Qjg1cUg4bTVRSUtGb2ZhMEdo?=
 =?utf-8?B?bmF5L2VOUGo1TElHK2ExK1k2blRFblpzWWMzU2JGbERTZG1rTndmaE80c3FY?=
 =?utf-8?B?SGZacldMc3EzbFcxVUVQUHVJVE9SVkxLM2RId1R6bGhJbjV6YzRqMm9tTHdB?=
 =?utf-8?B?MTd2MWN0NGtndU9la2FMUzgrRlhNUkx2MnJES0ZnN3d3VXNOdnNnc2Y3WGZI?=
 =?utf-8?B?MXNjVmMzcWNndzhYc3hWUGhydXdrZlFCd21MelBWb2wyR1JoaEd0Smp6WEwr?=
 =?utf-8?B?ZnV3WndIYTMwVGFKUWhlOEphN1ZXZ1o5QTFjamkzYlpuNVpIUk1XS202SHFI?=
 =?utf-8?Q?jZNpWjrALIw/Yet?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7e3193-0a68-4eff-5f87-08db0a54726a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 04:16:41.5692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zsd3XQVZgiSZz4mlov081iDuSoXF+7Gpdhw1uEfyYaHyz/XPLrhPaT8eSAdWra6i35wkPoVFEN8atQ2B1Xn/zO6qBipvrlY/FKE1sH3Ixwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR02MB8992
X-Proofpoint-GUID: 6NeQqaMaVPVPLLB9zasdca_qKvMoLIA0
X-Proofpoint-ORIG-GUID: 6NeQqaMaVPVPLLB9zasdca_qKvMoLIA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_02,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302090037
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

SGkgRG91ZywNCg0KSGF2ZSB5b3UgcGlja2VkIHRoZSBjb3JlIGNoYW5nZSB0byBwcm9ncmFtIGRz
cHAncyAgKGJlbG93KSA/IHRoZSBjdXJyZW50IHNlcmllcyB3aWxsIGdvIG9uIHRvcCBvZiBpdC4N
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hcm0tbXNtL3BhdGNo
LzE2NzE1NDI3MTktMTI2NTUtMS1naXQtc2VuZC1lbWFpbC1xdWljX2thbHlhbnRAcXVpY2luYy5j
b20vDQoNClRoYW5rcywNCkthbHlhbg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5G
cm9tOiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+U2VudDogV2VkbmVz
ZGF5LCBGZWJydWFyeSA4LCAyMDIzIDEwOjQ0IFBNDQo+VG86IEthbHlhbiBUaG90YSAoUVVJQykg
PHF1aWNfa2FseWFudEBxdWljaW5jLmNvbT4NCj5DYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmc7DQo+ZnJlZWRyZW5vQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPmtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHJvYmRjbGFya0BjaHJvbWl1bS5vcmc7IHN3Ym95ZEBjaHJv
bWl1bS5vcmc7DQo+Vmlub2QgUG9saW1lcmEgKFFVSUMpIDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMu
Y29tPjsNCj5kbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc7IEFiaGluYXYgS3VtYXIgKFFVSUMp
DQo+PHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+OyBtYXJpam4uc3VpanRlbkBzb21haW5saW5l
Lm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMC80XSBSZXNlcnZlIERTUFBzIGJhc2VkIG9u
IHVzZXIgcmVxdWVzdA0KPg0KPldBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91
dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5IG9mDQo+YW55IGxpbmtzIG9yIGF0dGFj
aG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+DQo+SGksDQo+DQo+T24gV2VkLCBG
ZWIgOCwgMjAyMyBhdCA1OjQyIEFNIEthbHlhbiBUaG90YSA8cXVpY19rYWx5YW50QHF1aWNpbmMu
Y29tPg0KPndyb3RlOg0KPj4NCj4+IFRoaXMgc2VyaWVzIHdpbGwgZW5hYmxlIGNvbG9yIGZlYXR1
cmVzIG9uIHNjNzI4MCB0YXJnZXQgd2hpY2ggaGFzDQo+PiBwcmltYXJ5IHBhbmVsIGFzIGVEUA0K
Pj4NCj4+IFRoZSBzZXJpZXMgcmVtb3ZlcyBEU1BQIGFsbG9jYXRpb24gYmFzZWQgb24gZW5jb2Rl
ciB0eXBlIGFuZCBhbGxvd3MNCj4+IHRoZSBEU1BQIHJlc2VydmF0aW9uIGJhc2VkIG9uIHVzZXIg
cmVxdWVzdCB2aWEgQ1RNLg0KPj4NCj4+IFRoZSBzZXJpZXMgd2lsbCByZWxlYXNlL3Jlc2VydmUg
dGhlIGRwdSByZXNvdXJjZXMgd2hlbiBldmVyIHRoZXJlIGlzIGENCj4+IHRvcG9sb2d5IGNoYW5n
ZSB0byBzdWl0IHRoZSBuZXcgcmVxdWlyZW1lbnRzLg0KPj4NCj4+IEthbHlhbiBUaG90YSAoNCk6
DQo+PiAgIGRybS9tc20vZHB1OiBjbGVhciBEU1BQIHJlc2VydmF0aW9ucyBpbiBybSByZWxlYXNl
DQo+PiAgIGRybS9tc20vZHB1OiBhZGQgRFNQUHMgaW50byByZXNlcnZhdGlvbiB1cG9uIGEgQ1RN
IHJlcXVlc3QNCj4+ICAgZHJtL21zbS9kcHU6IGF2b2lkIHVubmVjZXNzYXJ5IGNoZWNrIGluIERQ
VSByZXNlcnZhdGlvbnMNCj4+ICAgZHJtL21zbS9kcHU6IHJlc2VydmUgdGhlIHJlc291cmNlcyBv
biB0b3BvbG9neSBjaGFuZ2UNCj4+DQo+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2NydGMuaCAgICB8ICAyICsNCj4+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfZW5jb2Rlci5jIHwgNTggKysrKysrKysrKysrKysrKy0tLS0tLQ0KPi0tLS0tLS0NCj4+ICBk
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uYyAgICAgIHwgIDIgKw0KPj4gIDMg
ZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+DQo+SSB0
cmllZCBvdXQgeW91ciBjaGFuZ2VzLCBidXQgdW5mb3J0dW5hdGVseSBpdCBzZWVtcyBsaWtlIHRo
ZXJlJ3Mgc29tZXRoaW5nIHdyb25nLg0KPjooIEkgZGlkIHRoaXM6DQo+DQo+MS4gUGlja2VkIHlv
dXIgNSBwYXRjaGVzIHRvIHRoZSBjaHJvbWVvcy01LjE1IHRyZWUgKHRoaXMgc2VyaWVzIHBsdXMg
WzFdKQ0KPg0KPjIuIFB1dCB0aGVtIG9uIGhlcm9icmluZSB2aWxsYWdlci4NCj4NCj4zLiBCb290
ZWQgdXAgd2l0aCBubyBleHRlcm5hbCBkaXNwbGF5IHBsdWdnZWQgaW4uDQo+DQo+NC4gVHJpZWQg
dG8gZW5hYmxlIG5pZ2h0IGxpZ2h0IGluIHRoZSBDaHJvbWVPUyBVSS4NCj4NCj41LiBOaWdodCBs
aWdodCBkaWRuJ3QgdHVybiBvbiBmb3IgdGhlIGludGVybmFsIGRpc3BsYXkuDQo+DQo+DQo+SSBh
bHNvIHRyaWVkIGFwcGx5aW5nIHRoZW0gdG8gdGhlIHRvcCBvZiBtc20tbmV4dCAoaGFkIHRvIHJl
c29sdmUgc29tZSBzbWFsbA0KPmNvbmZsaWN0cykuIFNhbWUgdGhpbmcsIG5pZ2h0IGxpZ2h0IGRp
ZG4ndCB3b3JrLg0KPg0KPg0KPkkgdGhvdWdodCBtYXliZSB0aGlzIHdhcyBiZWNhdXNlIHRoZSBD
aHJvbWUgYnJvd3NlciBoYXNuJ3QgYmVlbiB1cGRhdGVkIHRvDQo+cHJvcGVybHkgdXNlIGF0b21p
Y19jaGVjayBmb3IgdGVzdGluZyBmb3IgbmlnaHQgbGlnaHQsIHNvIEkgaGFja2VkIG15IGhlcm9i
cmluZQ0KPmRldmljZSB0cmVlIHRvIG5vdCBtYXJrICJtZHNzX2RwIiBhcyAib2theSIuIE5vdyB0
aGVyZSdzIF9vbmx5XyBhbiBlRFAgZGlzcGxheS4NCj5TYW1lIHRoaW5nLCBuaWdodCBsaWdodCBk
aWRuJ3Qgd29yay4NCj4NCj4NCj5JIGNvdWxkIG9ubHkgZ2V0IG5pZ2h0IGxpZ2h0IHRvIHdvcmsg
Zm9yIHRoZSBpbnRlcm5hbCBkaXNwbGF5IGlmIEkgcGx1Z2dlZCBhbmQNCj51bnBsdWdnZWQgYW4g
ZXh0ZXJuYWwgZGlzcGxheSBpbi4NCj4NCj4NCj5JcyB0aGUgYWJvdmUgdGhlIGJlaGF2aW9yIHRo
YXQncyBleHBlY3RlZCByaWdodCBub3c/DQo+DQo+DQo+WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8xNjc0ODE0NDg3LTIxMTItMS1naXQtc2VuZC1lbWFpbC0NCj5xdWljX2thbHlhbnRA
cXVpY2luYy5jb20vDQo=
