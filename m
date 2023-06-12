Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795372B899
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 09:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B8110E1B7;
	Mon, 12 Jun 2023 07:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA08510E1A6;
 Mon, 12 Jun 2023 07:25:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35C6qhIJ013550; Mon, 12 Jun 2023 07:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=HMGL+7qXiI1SOUlL0JsMWcSOdjgVX+ZEG2pGDm0e15Y=;
 b=eBPOoguV3Q3TCvUDklb6VOz4aYj5+hJ2zighLXFerYTExnqZ+qqSd/2m1kfH7tb4HI2z
 Y6UBJoK7A3AwVRYhr/FPDmvhJdhU7U/quJ7wjwIMEu+cYrRlXjSNwdsg2CINJkyugXrO
 E5r3moZ3ktzVNF3lBBDSWfyyXJQHHuJhj9eqRaNuGv6VAM2iJnoNUmkQvXLIYoAiSa6+
 JXUK8Vb3Ed69ECG5Umnbd3BWkyQHIiCJumEAyfte6/BMYeOoS/eJAB4YPPPwOkELjFHT
 FRxZ66ISD/MMn7rLM2Av6+V4CroFnrJdRmO/H8p6U8zxRXnlK07np6pbFW/lKiUt1dkE Kw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r4hjbtkut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 07:25:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUA9CungV9GepQxuiRUyL40jRZBtuHSsYbhySgRVv+sQf9z0QkkewDV8lGniqPMo1vvA509wMGm9apeP3rSLwkpJndNNahjbPN87LYpN8CKd5KUvR3/suzNzux3VBERLJdTBcRVeVZ8vFdsRqgBQ29FRL9kDY1TuMoWxVnuwFad2JIF5aNMww2KhsDWA/RHthLb8l13l9evbuqj4cum0izgmhaELNpZhg6/o6o+CshNjXDzF/Q6pGv6ZmVf4lUr9Vzlcr3auo+hbxvgXnugPwAQocUhg+K7UmdXHkgsCQ6blokf1W8jMjkqWBzKVpDltWo6hPYTgpagMiHnNRO0PFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMGL+7qXiI1SOUlL0JsMWcSOdjgVX+ZEG2pGDm0e15Y=;
 b=ANaOqMWL//CyOHQ8EBJUlOZxnmj7KyiAyPmqXxfPR4yuf/9qahb9Fzb9EPDCGrwI491SgetkZIR7elUjFztmgM4WLmOL6JUCFZMo2Zs6sbYnHMvJuYbskrcwdMVJxHAAvgA52Tb7NqJpbbhbcnun1g5+grvoesTKVPLoKD1CJCAT92VXzGHIOdLubG6VjH9AG6o2hYecXfmK7CBc1oX05L+HZFLrEHzE3X3SMc6NWglfj1+OZlLObVOFjTQsII5frRyrtRlspmpZ8DBxc/i00z7qdsb0QVEAiPW/9z+33MewKrDIGMqqjd2UEtYdrSg9RIaWz6IYL2vEM2pQWk4NuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 by BL3PR02MB8964.namprd02.prod.outlook.com (2603:10b6:208:3b8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 07:25:51 +0000
Received: from BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::58d5:8bc2:2e27:8834]) by BN0PR02MB8142.namprd02.prod.outlook.com
 ([fe80::58d5:8bc2:2e27:8834%4]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 07:25:51 +0000
From: Kalyan Thota <kalyant@qti.qualcomm.com>
To: Yongqin Liu <yongqin.liu@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, "Kalyan Thota (QUIC)"
 <quic_kalyant@quicinc.com>
Subject: RE: [PATCH v4 2/4] drm/msm/dpu: add DSPPs into reservation upon a CTM
 request
Thread-Topic: [PATCH v4 2/4] drm/msm/dpu: add DSPPs into reservation upon a
 CTM request
Thread-Index: AQHZP5v+yCA0wyNoVk+kf7blc/U9f67lrySAgJ7dzwCAAu/coA==
Date: Mon, 12 Jun 2023 07:25:51 +0000
Message-ID: <BN0PR02MB8142223CBE3237B534194AC09654A@BN0PR02MB8142.namprd02.prod.outlook.com>
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
 <1676286704-818-3-git-send-email-quic_kalyant@quicinc.com>
 <20230301082403.vm4ejqod3ba5wkzp@SoMainline.org>
 <CAMSo37VmhB1-PUp1qu8gaxOXtu98eEYmWd71FOai+cwLb-JvSg@mail.gmail.com>
In-Reply-To: <CAMSo37VmhB1-PUp1qu8gaxOXtu98eEYmWd71FOai+cwLb-JvSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8142:EE_|BL3PR02MB8964:EE_
x-ms-office365-filtering-correlation-id: 5e8450bf-64db-48ff-e3a7-08db6b164021
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xwFXlDIiOKR7GjqBa0SIoOZlHjzGhM9sSVA9+yvOWdku45b18dSa+TQMLTdf8zPDKS9gZyBRfVLs9zJai12RNlcGSLMiQMgYROrO5s3h3rxsdoSwDRT3gCqtLwXAN5OU8VS7EcGFWgYu85S0lrejjWys0PBpdVJEz0aDv67XCATiFHleGthLes7n6Huu/bjGzpR/yneifVPhq41mvtpAlq68/eHaa5uLjZayNdZQe4glCaET+Xn2fiJRI8xMEgG3dfRzO/+Gwa+yZRL0O5roM4bdQNhLvnZYsvwrAY5dQcyrC2ekmLumZv/xocligtupe5mfMDkpxAkK9Dncc9mQD3avIlSjY0lJO2LRmkSYys5IlxTnWS47jMgYEU1Yc5rFR1rch1Wf/l09jUS3EgtOI6W+r1Z5FJvZE0bG0GhJZ30qQccVQqgkFRODtAzB9nDK03GxcpeXOwtXGILIOjeEieAykq6lcM/2mMc9LcdOuXEX5F2/cscr72e9bwVs0jS0PnotdBnb3t574aDDnXG6Rf1JfZDWd8dCQuA9WFO++3yZgNvJB+q+JIbpECEzM4CdV/UihzQyjj1Cz78Dd5gwsKcQTboI7YQ+bBaxMbh8kPg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB8142.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(84040400005)(451199021)(86362001)(2906002)(38070700005)(33656002)(7416002)(55016003)(966005)(7696005)(186003)(83380400001)(6506007)(26005)(53546011)(52536014)(9686003)(122000001)(71200400001)(110136005)(54906003)(66946007)(4326008)(66556008)(66446008)(64756008)(66476007)(316002)(38100700002)(478600001)(76116006)(5660300002)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TU5zZzFIRWxoZ1h0aGdLbFdFS2xjZnhiOHJXTzRQK3NIbmNZSDBSYnVQUEkv?=
 =?utf-8?B?eE5wQlZ5QTZPZFBOT2hXM25LcENBMTRNTmorSTZyS3EyRFlBU3k4VlJIZ2Nv?=
 =?utf-8?B?OThqZytnWHphMkVPQ2NFSzh1SjFxZkp6dUNsODMvUklOVko3RkVBODRtV09n?=
 =?utf-8?B?RjJackV0OUt2bDhZczMyOStMNUhUNEtFSkxaTkJSRTdrc1ppNGY0TzdyUEdH?=
 =?utf-8?B?cWs1K1U5NzdBZ1J5YjVIamEvWTcwVEtzRkRZR3N4VDF5aUI0Vm1taFJNc2Z0?=
 =?utf-8?B?UkpMSkx3THFjMncyaTBORzZzV2tLZFRxL0tsbm5tR2J5ZlhXSVNsVFpPQUQy?=
 =?utf-8?B?K3VJdnpaTDhNTDN0bjBNdEhnVXFucjJsTE9JYlRGRUp6MnFrMlRxL2I1Njl0?=
 =?utf-8?B?WFBxVDkwazZyK1hPbFA1NmxEbHRWZDFaQ3JoZC9uVi82WVZPQnd0QU83OTNq?=
 =?utf-8?B?TFN5WTMwei9xcHIwaU0vbWRzdFlqd2dYb1poRFlWMlFGdVgwNE5sSGFIeVJG?=
 =?utf-8?B?MUs0ajhiL0ovdzBNaEpRZnpSczBDOFM0QWFxRTlseUJ4SWUrdkwrOWliaTJL?=
 =?utf-8?B?SzhhVTlEUTVTaHBNK2tmdWQwaXJVcXIwdkl0NmNvM2Y2RTlMd2pkU1pTa1Fp?=
 =?utf-8?B?UTMrMjlWYzVyelE0eldyczlDQ3ZhTWp3NjdNQVhVeVRlY2JUc1o1ak9xa1dE?=
 =?utf-8?B?TndXdHNZWjB5cWVNdFcrbzFOSXVFRWV1SmxMNnVRd0dHZEF4NEVTWUdKRlhF?=
 =?utf-8?B?ek9ndUJlbjlPVzhTTXRzZjNXZ2hudTJ3UGFGNUFSWjV6QlJqa3Qyd1ZFMFRL?=
 =?utf-8?B?VkdBcytRaTRNUjFZaEZTV1IrbnpCU1E0bGhCeFJjbmFDcnE5R2hZWm0xOVNh?=
 =?utf-8?B?RXFQWWdlaXVtN2hpODh1ME1Td2hOZXVYK1BXekRMakNrSHN1TGtGTGZrRCt4?=
 =?utf-8?B?S0JLQ00xVEgxNUo5V2VFQlc2T1hiS05KMDBCZmpHT3VnUk93RFdNem9PYlBG?=
 =?utf-8?B?d3NNSXNWeTNrTjVUMWN5SStMZWdSZEM1QmJNbUFlaEVIdDFrWHhlbG10Tm9E?=
 =?utf-8?B?aUNvL2Q5Sm9FSVdDQkRmNHptbFhUWGV3WS9QLzN4NHlnL3JkWEpCODZqejdh?=
 =?utf-8?B?UzBhNHovRDdNQ3VMdzBFOVZFWTZ6Mm9pZ1ZJYTVqL20veG1BS3RNelJrT3lV?=
 =?utf-8?B?S0k2MW9nbHBzcGl5TkNZVFhEOFIxdDZCVTVYdks1VklvL2EvdTlmQVZ3bkgy?=
 =?utf-8?B?VlZldVFMMS9mS0h4RThuektxTUxNV1NFWHBkNXQxcDdlYjc0ZjVnWWcrZ3JF?=
 =?utf-8?B?U2tSdG40YjFPbkZnWTVZZUl4bXp5YU9ha2ZsZ3ZDdHM1R3NZbXZkK3dFS09Y?=
 =?utf-8?B?OVNma2MwT0dRQ252VGhiVkxCSVZXTkgvYUVZdHh6OFNVUnc4SWZxL1FVK3pz?=
 =?utf-8?B?cFZzcUlMSEhhYXpwZ1ByRmZVSXIveFZBdmh1YnBFUHgwcFA0S21TODhzWG5O?=
 =?utf-8?B?RHFZakg1SGpHcXp1TUpxa0EzazN6ZU16cWpVbVd0aitZcGNJaWlXSWhjQnJW?=
 =?utf-8?B?Tm9acUlQZVgycGUzWXNJYXpTWVlhcWFBQWw4TVJzRW9aQUxibWk1Z3RWZTgv?=
 =?utf-8?B?WVQ4QjA3bEhQTFMycmkwcHZGY3BmMWNNUnBzT2kxRUtOMHU5Y2t0cXY4TTZh?=
 =?utf-8?B?SGtEV0czWGk3blN1WDE5cG9adzNTcWZSM2YrY3JVSk1PRlZLT3RPNjN1M0Mw?=
 =?utf-8?B?NHZMaW5iamIyYzg0aDZJVmlNanVBbUFkYmxMejhQQmxYck5aUVozbmgzQ0lr?=
 =?utf-8?B?SVNWc2NBNVc5S3lxeWU5dTJrZHo4aHlKb01GSFVFNzRxdllENnUvT3BLRURj?=
 =?utf-8?B?N0hPNm9QbTkrRnNNV0VFbUZMUkVTMVB3dHJsaktaN2Q0eVpOTXVRd2tyOE9P?=
 =?utf-8?B?cnlVOFhHcUhWdXovZ2NmUXFaTktKWVpIcGM2MElUZDJNcHRWZU5EQlp2WndI?=
 =?utf-8?B?cnU3Z1h1S0hoZHp5cFRKbmI0Rmx5cW5lWWhxU0N5MnVKYUdoYm04VjRYSHR5?=
 =?utf-8?B?QnFLTXBQSENvZ2k4aTV6RDdDNjI4NE52a3RmWGdubkhjKzRPZHJnWitaSlFu?=
 =?utf-8?Q?9+CJMf2Jl4x6b6+sXv5lonnHY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?QS9lR01CVTIyNnVnSnhiVnBJUCtpdG5ubGsvOUthOXgrbUl6OGJCeUNaVmdL?=
 =?utf-8?B?MDB4WXZ1UU5SZStUWU83U3JKdHZTOURQVVFzcEYvMlUyUUdFeFg3NCt4ZWF2?=
 =?utf-8?B?a3R1dWZ3OVl4bHJCRndTMzJsTWFHWGFJbjF5QU12STFsclVpNmVTV1g4UTB2?=
 =?utf-8?B?WlRRdWc5UlBDclBtV2c3bkRlZnNDWHp5V3pZb2wvRUdDMURKSVVGbVEvVlpQ?=
 =?utf-8?B?UnhCYnI4cTFxSEtFUjc4S2crMGtUNTV1N2JkYkJSQjhzdkpxMUpUV3p3Vzli?=
 =?utf-8?B?ZHY4TTlUWVdHbFJhay9Lbk1qY0p1ckd2TFpiNk16QVI1T2FSYVZNQm9sK3di?=
 =?utf-8?B?UDNOSVV3SkszZzNrK0xhcUdpSmFoaDRaWlNYM1FScVFLUVJLZWwvQ3ozQW1F?=
 =?utf-8?B?MGhsN29HVzFUREJYdk5oSEw0SnNCQUpNSFpVQWNHZG1uaEd5OXRxNCtmUkdn?=
 =?utf-8?B?ZmtZOUhwUmI3cHdOMUpFY2JkaUxPcUNBMDRlQ1JZbXpsUzgxRHdsZjRDeFBB?=
 =?utf-8?B?aFZ4c2NVMmZxd21ld3p3OWlpVm5BK2Q0UEVVc2ZnQ1BaRHIwbzdaVXc1S3Rt?=
 =?utf-8?B?MWlXQ3U3bU9HMllxdXJlRGpSVEplUERuU2VmZHIxZTVpS3FyNmoreHBHd3dF?=
 =?utf-8?B?SGR1czJ5bXZYYjRxZDRBNXlpZWYyTjNqT0JEV0crRzFoTWFmRFhia0s4NklD?=
 =?utf-8?B?MDV4aVRNdXk0VTduL2ZWOEhtSXMzalVvNjFQMUFnRSszMGlRdVUxS3hwanN5?=
 =?utf-8?B?cVVnZTIyU2ZNVFZ0Zk1RMldTdWdUbGtmVDJQVE9RRm8xZHpxUDQ2LzIrOUQr?=
 =?utf-8?B?NGhOS1Z1MjdpdlB2L2RhdWxhaXdscW04VVNpZy9lUE9mYTgzNUVQZ2hmUzFR?=
 =?utf-8?B?Z2hJNTNTdTdDbVdnb3lPV1BSQWY1K1hBVmlHZVlOd28rSXdFemI2MlAwMndk?=
 =?utf-8?B?RXhPaEhLbjZDMG5uQllZNkFTZTVXRDhQak9wQnFtOXFzcnFKNEwzYms5cS9J?=
 =?utf-8?B?T0xobGdoeThXbnp0clNBb2NqVjI1eVVudTJ4ckprSFFrM2NmcWpJdE1vdmFN?=
 =?utf-8?B?UWMwUjV6d3JOTkI1aVBPa010cS9MQ0VLOXRzajJRb014ZkcvSWthbmx6NTVj?=
 =?utf-8?B?REV3VVZSd2tVZy9IOWMyUFd2VXl0MWUrbGpwM1RHYTZDM2hqc1U1VzNWTVBo?=
 =?utf-8?B?UHhLOVBGMTlqaHdub1dIdHFyMnNaY1d4WSttSGdVZ1M5TkFzbGtMc0UzQXRh?=
 =?utf-8?B?djdCNnptWkF3V2sxU2xVNnhXZlByblVBS3JQekNWekk5R1dwcHdlemgzY0hP?=
 =?utf-8?Q?8/IwKvFSC0iJ4=3D?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8450bf-64db-48ff-e3a7-08db6b164021
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 07:25:51.2045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EKyRBm09Af3StV0iSN9Q1UQ6iYL0wNfubc96FEuJbJjzb47PPbhykCmQa5BdKFQVMdc+qSnfyaYKrcyeVpJbWlIbHF/I4Vc0R5NdHTPaFKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8964
X-Proofpoint-ORIG-GUID: BEpm_bZehqCYNTrIsuVTZLI0jLzG-T10
X-Proofpoint-GUID: BEpm_bZehqCYNTrIsuVTZLI0jLzG-T10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_04,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306120063
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 Amit Pundir <amit.pundir@linaro.org>, John Stultz <jstultz@google.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "Vinod
 Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB5b3VyIGVtYWlsLiBDYW4geW91IGhlbHAgc2hhcmUgc29tZSBkZXRhaWxzLg0K
MSkgaHR0cHM6Ly90ZXJtYmluLmNvbS8zMWxjICwgSSBhbSB1bmFibGUgdG8gb3BlbiB0aGUgbGlu
ayBpbiBteSBvZmZpY2UgbmV0d29yaywgY2FuIHlvdSBjb3B5IHRoZSBsb2dzIGluIGEgdGV4dCBm
aWxlIGFuZCBzaGFyZSB3aXRoIG1lLg0KMikgV2hpY2ggRFBVIHZlcnNpb24gYXJlIHlvdSB0cnlp
bmcgZnJvbSB0aGUgY2F0YWxvZ3VlLCBjYW4geW91IHNoYXJlIHRoZSB2ZXJzaW9uID8NCjMpIFRo
ZSBwYXRjaCB3aWxsIGZhaWwgdGhlIGF0b21pY19jaGVjaywgaWYgdGhlIGNvbW1pdCBpcyByZXF1
ZXN0aW5nIGZvciBhIENUTSwgYW5kIHRoZXJlIGFyZSBubyBkc3BwIEhXIGJsb2NrcyB0byByZXNl
cnZlLiBDYW4geW91IGNoZWNrIGluIHlvdXIgY2F0YWxvZ3VlIGVudHJ5IHRoYXQgeW91IGhhdmUg
c3VmZmljaWVudCBkc3BwIHJlc291cmNlcyB0byBMTSANCg0KVGhhbmtzLA0KS2FseWFuDQoNCj4t
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFlvbmdxaW4gTGl1IDx5b25ncWluLmxp
dUBsaW5hcm8ub3JnPg0KPlNlbnQ6IFNhdHVyZGF5LCBKdW5lIDEwLCAyMDIzIDM6NTcgUE0NCj5U
bzogTWFyaWpuIFN1aWp0ZW4gPG1hcmlqbi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnPjsgS2FseWFu
IFRob3RhIChRVUlDKQ0KPjxxdWljX2thbHlhbnRAcXVpY2luYy5jb20+DQo+Q2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnOw0K
PmZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC0NCj5rZXJuZWxAdmdlci5rZXJuZWwub3JnOyByb2JkY2xhcmtAY2hyb21pdW0u
b3JnOyBkaWFuZGVyc0BjaHJvbWl1bS5vcmc7DQo+c3dib3lkQGNocm9taXVtLm9yZzsgVmlub2Qg
UG9saW1lcmEgKFFVSUMpIDxxdWljX3Zwb2xpbWVyQHF1aWNpbmMuY29tPjsNCj5kbWl0cnkuYmFy
eXNoa292QGxpbmFyby5vcmc7IEFiaGluYXYgS3VtYXIgKFFVSUMpDQo+PHF1aWNfYWJoaW5hdmtA
cXVpY2luYy5jb20+OyBBbWl0IFB1bmRpciA8YW1pdC5wdW5kaXJAbGluYXJvLm9yZz47IFN1bWl0
DQo+U2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz47IEpvaG4gU3R1bHR6IDxqc3R1bHR6
QGdvb2dsZS5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzRdIGRybS9tc20vZHB1OiBh
ZGQgRFNQUHMgaW50byByZXNlcnZhdGlvbiB1cG9uIGENCj5DVE0gcmVxdWVzdA0KPg0KPldBUk5J
Tkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFz
ZSBiZSB3YXJ5IG9mIGFueQ0KPmxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJs
ZSBtYWNyb3MuDQo+DQo+SGksIEthbHlhbiBUaG90YQ0KPg0KPkl0IHNlZW1zIHRoaXMgY2hhbmdl
IGNhdXNlZCBzb21lIGRybSBwcm9ibGVtcyB3aXRoIHRoZSBBbmRyb2lkIGJ1aWxkLg0KPkkgdGVz
dGVkIHdpdGggb25lIEFuZHJvaWQgYnVpbGQgdGhhdCBiYXNlZCBvbiB0aGUgQUNLIGFuZHJvaWQt
bWFpbmxpbmUga2VybmVsWzFdLA0KPmFuZCB0aGVyZSBhcmUgdGhlIG1lc3NhZ2UgcHJpbnRlZCBs
aWtlDQo+ICAgIDAxLTAxIDA2OjUxOjUwLjU0MSAgIDUwNCAgIDUwNCBFICAgICAgICAgOg0KPltk
cm06X2RwdV9ybV9jaGVja19sbV9hbmRfZ2V0X2Nvbm5lY3RlZF9ibGtzXSBbZHB1IGVycm9yXWZh
aWxlZCB0byBnZXQgZHNwcA0KPm9uIGxtIDANCj4gICAgMDEtMDEgMDY6NTE6NTAuNTUxICAgNTA0
ICAgNTA0IEUgICAgICAgICA6DQo+W2RybTpfZHB1X3JtX2NoZWNrX2xtX2FuZF9nZXRfY29ubmVj
dGVkX2Jsa3NdIFtkcHUgZXJyb3JdZmFpbGVkIHRvIGdldCBkc3BwDQo+b24gbG0gMA0KPiAgICAw
MS0wMSAwNjo1MTo1MC41NjAgICA1MDQgICA1MDQgRSAgICAgICAgIDoNCj5bZHJtOl9kcHVfcm1f
Y2hlY2tfbG1fYW5kX2dldF9jb25uZWN0ZWRfYmxrc10gW2RwdSBlcnJvcl1mYWlsZWQgdG8gZ2V0
IGRzcHANCj5vbiBsbSAwDQo+ICAgIDAxLTAxIDA2OjUxOjUwLjU3MCAgIDUwNCAgIDUwNCBFICAg
ICAgICAgOg0KPltkcm06X2RwdV9ybV9jaGVja19sbV9hbmRfZ2V0X2Nvbm5lY3RlZF9ibGtzXSBb
ZHB1IGVycm9yXWZhaWxlZCB0byBnZXQgZHNwcA0KPm9uIGxtIDANCj4gICAgMDEtMDEgMDY6NTE6
NTAuNTc5ICAgNTA0ICAgNTA0IEUgICAgICAgICA6DQo+W2RybTpfZHB1X3JtX21ha2VfcmVzZXJ2
YXRpb25dIFtkcHUgZXJyb3JddW5hYmxlIHRvIGZpbmQgYXBwcm9wcmlhdGUgbWl4ZXJzDQo+ICAg
IDAxLTAxIDA2OjUxOjUwLjU4OCAgIDUwNCAgIDUwNCBFICAgICAgICAgOiBbZHJtOmRwdV9ybV9y
ZXNlcnZlXQ0KPltkcHUgZXJyb3JdZmFpbGVkIHRvIHJlc2VydmUgaHcgcmVzb3VyY2VzOiAtMTE5
IEZvciBkZXRhaWxzLCBwbGVhc2UgY2hlY2sgdGhlIGxpbmsNCj5oZXJlOiBodHRwczovL3Rlcm1i
aW4uY29tLzMxbGMNCj4NCj5JZiBJIHJldmVydCB0aGlzIGNvbW1pdCwgdGhlbiB0aGUgcHJvYmxl
bSB3aWxsIGJlIGdvbmUuDQo+Q291bGQgeW91IHBsZWFzZSBoZWxwIGNoZWNrIGlmIHRoZXJlIGlz
IGFueSBwcm9ibGVtIHdpdGggdGhpcyBjb21taXQ/DQo+DQo+WzFdOiBodHRwczovL2FuZHJvaWQu
Z29vZ2xlc291cmNlLmNvbS9rZXJuZWwvY29tbW9uLysvcmVmcy9oZWFkcy9hbmRyb2lkLQ0KPm1h
aW5saW5lDQo+DQo+VGhhbmtzLA0KPllvbmdxaW4gTGl1DQo+DQo+T24gV2VkLCAxIE1hciAyMDIz
IGF0IDE2OjI0LCBNYXJpam4gU3VpanRlbiA8bWFyaWpuLnN1aWp0ZW5Ac29tYWlubGluZS5vcmc+
DQo+d3JvdGU6DQo+Pg0KPj4gT24gMjAyMy0wMi0xMyAwMzoxMTo0MiwgS2FseWFuIFRob3RhIHdy
b3RlOg0KPj4gPiBBZGQgRFNQUCBibG9ja3MgaW50byB0aGUgdG9wb2xvZ3kgZm9yIHJlc2VydmF0
aW9uLCBpZiB0aGVyZSBpcyBhIENUTQ0KPj4gPiByZXF1ZXN0IGZvciB0aGF0IGNvbXBvc2l0aW9u
Lg0KPj4gPg0KPj4gPiBTaWduZWQtb2ZmLWJ5OiBLYWx5YW4gVGhvdGEgPHF1aWNfa2FseWFudEBx
dWljaW5jLmNvbT4NCj4+ID4gUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5i
YXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4+DQo+PiBSZXZpZXdlZC1ieTogTWFyaWpuIFN1aWp0ZW4g
PG1hcmlqbi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnPg0KPj4NCj4+ID4gLS0tDQo+PiA+IENoYW5n
ZXMgaW4gdjE6DQo+PiA+IC0gTWlub3Igbml0cyAoRG1pdHJ5KQ0KPj4gPg0KPj4gPiBDaGFuZ2Vz
IGluIHYyOg0KPj4gPiAtIFBvcHVsYXRlIERTUFBzIGludG8gdGhlIHJlc2VydmF0aW9uIG9ubHkg
aWYgQ1RNIGlzIHJlcXVlc3RlZA0KPj4gPiAoRG1pdHJ5KQ0KPj4gPiAtLS0NCj4+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgfCAxNSArKysrKystLS0tLS0t
LS0NCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
DQo+PiA+DQo+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfZW5jb2Rlci5jDQo+PiA+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Vu
Y29kZXIuYw0KPj4gPiBpbmRleCA5YzY4MTdiLi40NmQyYTVjIDEwMDY0NA0KPj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jDQo+PiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMNCj4+ID4gQEAgLTU0NSw3
ICs1NDUsOCBAQCBib29sIGRwdV9lbmNvZGVyX3VzZV9kc2NfbWVyZ2Uoc3RydWN0DQo+PiA+IGRy
bV9lbmNvZGVyICpkcm1fZW5jKSAgc3RhdGljIHN0cnVjdCBtc21fZGlzcGxheV90b3BvbG9neQ0K
PmRwdV9lbmNvZGVyX2dldF90b3BvbG9neSgNCj4+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBkcHVfZW5jb2Rlcl92aXJ0ICpkcHVfZW5jLA0KPj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMsDQo+PiA+IC0gICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkNCj4+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLA0KPj4gPiArICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPj4gPiAgew0KPj4gPiAgICAg
ICBzdHJ1Y3QgbXNtX2Rpc3BsYXlfdG9wb2xvZ3kgdG9wb2xvZ3kgPSB7MH07DQo+PiA+ICAgICAg
IGludCBpLCBpbnRmX2NvdW50ID0gMDsNCj4+ID4gQEAgLTU2Myw4ICs1NjQsNyBAQCBzdGF0aWMg
c3RydWN0IG1zbV9kaXNwbGF5X3RvcG9sb2d5DQo+ZHB1X2VuY29kZXJfZ2V0X3RvcG9sb2d5KA0K
Pj4gPiAgICAgICAgKiAxIExNLCAxIElOVEYNCj4+ID4gICAgICAgICogMiBMTSwgMSBJTlRGIChz
dHJlYW0gbWVyZ2UgdG8gc3VwcG9ydCBoaWdoIHJlc29sdXRpb24gaW50ZXJmYWNlcykNCj4+ID4g
ICAgICAgICoNCj4+ID4gLSAgICAgICogQWRkaW5nIGNvbG9yIGJsb2NrcyBvbmx5IHRvIHByaW1h
cnkgaW50ZXJmYWNlIGlmIGF2YWlsYWJsZSBpbg0KPj4gPiAtICAgICAgKiBzdWZmaWNpZW50IG51
bWJlcg0KPj4gPiArICAgICAgKiBBZGQgZHNwcHMgdG8gdGhlIHJlc2VydmF0aW9uIHJlcXVpcmVt
ZW50cyBpZiBjdG0gaXMNCj4+ID4gKyByZXF1ZXN0ZWQNCj4+ID4gICAgICAgICovDQo+PiA+ICAg
ICAgIGlmIChpbnRmX2NvdW50ID09IDIpDQo+PiA+ICAgICAgICAgICAgICAgdG9wb2xvZ3kubnVt
X2xtID0gMjsNCj4+ID4gQEAgLTU3MywxMSArNTczLDggQEAgc3RhdGljIHN0cnVjdCBtc21fZGlz
cGxheV90b3BvbG9neQ0KPmRwdV9lbmNvZGVyX2dldF90b3BvbG9neSgNCj4+ID4gICAgICAgZWxz
ZQ0KPj4gPiAgICAgICAgICAgICAgIHRvcG9sb2d5Lm51bV9sbSA9IChtb2RlLT5oZGlzcGxheSA+
DQo+PiA+IE1BWF9IRElTUExBWV9TUExJVCkgPyAyIDogMTsNCj4+ID4NCj4+ID4gLSAgICAgaWYg
KGRwdV9lbmMtPmRpc3BfaW5mby5pbnRmX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EU0kpIHsN
Cj4+ID4gLSAgICAgICAgICAgICBpZiAoZHB1X2ttcy0+Y2F0YWxvZy0+ZHNwcCAmJg0KPj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgKGRwdV9rbXMtPmNhdGFsb2ctPmRzcHBfY291bnQgPj0gdG9w
b2xvZ3kubnVtX2xtKSkNCj4+ID4gLSAgICAgICAgICAgICAgICAgICAgIHRvcG9sb2d5Lm51bV9k
c3BwID0gdG9wb2xvZ3kubnVtX2xtOw0KPj4gPiAtICAgICB9DQo+PiA+ICsgICAgIGlmIChjcnRj
X3N0YXRlLT5jdG0pDQo+PiA+ICsgICAgICAgICAgICAgdG9wb2xvZ3kubnVtX2RzcHAgPSB0b3Bv
bG9neS5udW1fbG07DQo+PiA+DQo+PiA+ICAgICAgIHRvcG9sb2d5Lm51bV9lbmMgPSAwOw0KPj4g
PiAgICAgICB0b3BvbG9neS5udW1faW50ZiA9IGludGZfY291bnQ7IEBAIC02NDMsNyArNjQwLDcg
QEAgc3RhdGljIGludA0KPj4gPiBkcHVfZW5jb2Rlcl92aXJ0X2F0b21pY19jaGVjaygNCj4+ID4g
ICAgICAgICAgICAgICB9DQo+PiA+ICAgICAgIH0NCj4+ID4NCj4+ID4gLSAgICAgdG9wb2xvZ3kg
PSBkcHVfZW5jb2Rlcl9nZXRfdG9wb2xvZ3koZHB1X2VuYywgZHB1X2ttcywgYWRqX21vZGUpOw0K
Pj4gPiArICAgICB0b3BvbG9neSA9IGRwdV9lbmNvZGVyX2dldF90b3BvbG9neShkcHVfZW5jLCBk
cHVfa21zLA0KPj4gPiArIGFkal9tb2RlLCBjcnRjX3N0YXRlKTsNCj4+ID4NCj4+ID4gICAgICAg
LyogUmVzZXJ2ZSBkeW5hbWljIHJlc291cmNlcyBub3cuICovDQo+PiA+ICAgICAgIGlmICghcmV0
KSB7DQo+PiA+IC0tDQo+PiA+IDIuNy40DQo+PiA+DQo+DQo+DQo+DQo+LS0NCj5CZXN0IFJlZ2Fy
ZHMsDQo+WW9uZ3FpbiBMaXUNCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4jbWFpbGluZyBsaXN0DQo+bGluYXJvLWFuZHJv
aWRAbGlzdHMubGluYXJvLm9yZw0KPmh0dHA6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vbGluYXJvLWFuZHJvaWQNCg==
