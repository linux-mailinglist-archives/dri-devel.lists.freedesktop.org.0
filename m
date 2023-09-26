Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4837AEAA2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA66210E0C8;
	Tue, 26 Sep 2023 10:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C34310E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 10:41:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38Q8wMmW005068; Tue, 26 Sep 2023 10:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=6WWCIM1hsCm7YxUSjXpKBb/JQTnmmHmuM2xt8ET4OBI=;
 b=U/LsqWOzzLlF9SFArNMfiHa6ImFK7fF/6El+IV97I6c/rA35VNNb6V0Wd4ick7bUZlD7
 m+bwByvcnEBgKVWJSESCsyOM/stziWPnKa1Yhvu17IX8EZ+K52Cx++a+4mIx9zLBHKF3
 v9W+VFvmEAeDY7RC3dN0ZrtM1ro4k8RkVYGtvujU85XbWW09u8eXEwiW/75BQRET4wX1
 4jTqtkPsCqR5Hvwj0pSJNAW/DKiI/iuaa5z1Dn9YJ7RfwoZJFM6WPCoAcuAUG7lEFGFO
 VhXx2ygSogdjClOVzOMjhg+8xpKpWZ1lBePeSCj4W0FEy6tqHwHPamJMMDIAAEaLsIDw Pg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tbbyf2deg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 10:41:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbwvlCaegihze/8rnBtv2STlqzV+c0RzSGAbJblLX4+xpeqrLet4GrERWNadJoXkY+jKhiUEP7VUGrFQSOTEn49Lek+HChdRA4hak70wdKrmUu8tU0omD48CoK4zUYjZFn0ZDyE07nkFoN+xaeYQLRrguLB0z8/4XsqJk8Caz6HqukeFqVzlfyZYmuUwuS7lMn8C686XmgVEgAy7isWigoPBYSBpXPtZUiJqudjys3Xo3KqqHDS+TZNjclvznzC1Cl/VHV6/iWbiUelzqhEQ7oI+28ceUwTwQyYhw0YLH3hnFiL3vXelvLu1COD6J+4L0mBiZcvk7WCqdH92ilFNig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WWCIM1hsCm7YxUSjXpKBb/JQTnmmHmuM2xt8ET4OBI=;
 b=ITBgfLwSel2FjD4ktjDt/6vnNVF5RdOIBAiNIQZyHBwiXBzxaCtl0508OZWYfAGCBvgUbwIsAudrrOWpgl9UTFPpuY4oml7GpX24Eybb7s41Wd8Irk5m1kbAnvMO0i7o7kqZzfD0CMo6bf5tEgajk4ZHK5MmPT3TNeZVOuK6eMqeteDyUJkgd+2mbrDPvfIrY2vUhNRjULKa0ktU7KUFsDiXC88OOZoqdrvKKcPyaQwWBu9Y1ZMcxsbaAQ8G+bt3SjfUL5FBhBm2eydckD7eqYrXitvspeyCz12/9UJ3gs5yUp+Tkj1+C/OtxNDc/qOJ+K23CfpyRo5PcQ6/9thUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB7951.namprd02.prod.outlook.com (2603:10b6:408:169::8)
 by BN0PR02MB7918.namprd02.prod.outlook.com (2603:10b6:408:161::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 10:41:46 +0000
Received: from BN0PR02MB7951.namprd02.prod.outlook.com
 ([fe80::ed2:9f26:8ab:82fc]) by BN0PR02MB7951.namprd02.prod.outlook.com
 ([fe80::ed2:9f26:8ab:82fc%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 10:41:46 +0000
From: Ramya SR <rsr@qti.qualcomm.com>
To: Alex Deucher <alexdeucher@gmail.com>, "imre.deak@intel.com"
 <imre.deak@intel.com>
Subject: RE: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Thread-Topic: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Thread-Index: AQHZ55DQhVb08bi8cEKL8zMH3hln2LAnP4GAgAAFlICABGzqAIABSYSw
Date: Tue, 26 Sep 2023 10:41:46 +0000
Message-ID: <BN0PR02MB79517B267D593DC484BA34DF81C3A@BN0PR02MB7951.namprd02.prod.outlook.com>
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
 <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
 <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
 <CADnq5_NQnQoheKv39DiuLjKY3Z83WpesrFRUO4FMdrn=YPhnSQ@mail.gmail.com>
In-Reply-To: <CADnq5_NQnQoheKv39DiuLjKY3Z83WpesrFRUO4FMdrn=YPhnSQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB7951:EE_|BN0PR02MB7918:EE_
x-ms-office365-filtering-correlation-id: 1db3d7a2-9fc1-4269-d430-08dbbe7d2e9b
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nq7WwyN3JJFqzEmS4U3/eIhG8zrH6agBo9BqGY3qPY9aonfv06lR/KScISK8Fcmikqb2QcpodUBYGfWNb3UHPaUVmhM0i/gkYAMvcu1XJB0h2XDLPjUSQ52KDn4cbN8n3uebShEWgGRv5NUKMZfrBU4gbzmO6YMvXZ7Pu/hCqqtOcJz5JVNGT855o4VGP5jjOooe0PZ308o98qkAZOXd0nxUc30XaedX7JlkXTfcXmA81va3H0gCy7AIGFF0IYGKIebmnJKbflbOvlOvbb5cUC4o5PhYhcPicx9oQxu+tNn1IZMTVmA0TJLz98Vc/fCnhrGuiiykNCHMsz5Zr9euNR4Efcu/reSU0a9JJAZS47u0vSGVw9naHsSrB80radvDh2rpV5QJtHBKxhnp9natcen4QM6egzUvmUqeU84df3CCK5Rbliyid3LJstPy3MnT2W10Lls/OJ3RbacVtyaCqpGwyKLsqEqXEmqXfhODsWw8PBIhWA6BIce2xgTGUEHZIIJ/3dD7vkQHQXC8WERsd9OAZb7E1pwqrerjTsqxdci9XfPTn98mTS+1Up7cZH2wIaCOKWD4j62l2hDVs6v0g7aKU5hi6E5teGi1gFK3eGBr/7+2fpVb/Qu9V5ile6zA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR02MB7951.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(9686003)(53546011)(6506007)(7696005)(71200400001)(83380400001)(122000001)(38070700005)(86362001)(33656002)(38100700002)(107886003)(55016003)(26005)(52536014)(2906002)(66556008)(316002)(41300700001)(66946007)(64756008)(54906003)(66446008)(66476007)(4326008)(478600001)(110136005)(76116006)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmJReHlkZXJzUTJETFJOK0tVeW5iMDlkSkwxZ2RSQlBKZk5zN3pzRFBGVUZq?=
 =?utf-8?B?T1RLZG1UVzRwTHdFSll3ZlM1dUhHNXRuRy9CZVNQdnhEV0NqY1RvRGRTNGJz?=
 =?utf-8?B?cUU4YkdObGo5clhtZUlNdTRGL2p5aXNBYjZhNXpXUjFNTGlROStLT2cwdS9Y?=
 =?utf-8?B?cGQ3TktpTno0a2xSNFVZNXM0NTFKSS9nK21ML3d1cW4rRGNuWEtvZ1NXZUZo?=
 =?utf-8?B?N0RHRE9FSWVGaThxRkVTWDcvQUxRNVZVWEQxcEkvbDB6aVFtRGFNMXNNc2gy?=
 =?utf-8?B?SHJRQ3M5Z1RwY0p1NTF4dFJUZks1SXhFUFVwdi9uTCtsYmNlRmcvQkQ5dVoy?=
 =?utf-8?B?OUd2d29xRENVTno3Y3ZjWHpXZXQ5WUw1Z0RrbXdhakVmL2VQS2hRRERVQ2hs?=
 =?utf-8?B?K1ZaVW9lQ0diZzdkQ1BDV1dmWll3T08zVmNNa3RXNWptRld2V0x5Q20wd0Z6?=
 =?utf-8?B?UG91VzNhWlBRRjJURWM2S0hvUmZYcy81QTRDYjBFTmsyZ2lMYklWcTE5UFhm?=
 =?utf-8?B?V1JQVjh0ZnVoMThZVjlOMjhSdHVrS0V4eTFvc1paSmo4dmVhZm5NMVhNWW9L?=
 =?utf-8?B?WHhtVDN3b3hRRUFEUC9kL1JibU9mTm01cDUzTmJqeVg1cUw1c0N2SEN0bnZR?=
 =?utf-8?B?aC83OUt3ajZnWGw2R1NHZmpRY1FpcFptMkZsZjlNc1pWbWsyVkNmTHd2YnJE?=
 =?utf-8?B?Q21BNndnSFU0RkRpWnRuTDdiMFBuVm1Bc2JIOVpTalFIdDZISkZpSTZHVUZV?=
 =?utf-8?B?R2xmOFc1dE8zd3VSVUtrR0M5WmZWc3hudmN2c091VjVZTkp2V2NaUklpUkpo?=
 =?utf-8?B?SHdBdVBpaCtsUVZaOEpGVHlmVkNkcXUvU2tOTy90Y0tGdVBaOVVocGIzbXFZ?=
 =?utf-8?B?SVpKdXFoanRmTEhFS3BMQUJLN1lDd2lxcy94cnFwdUpJSHpEZVpvN0hQdFFr?=
 =?utf-8?B?VitIQzNMODhCSUdCekFiWjNQYjZKUDJzenRqQ1RDeC9HWURoN0hQczRQQ2NQ?=
 =?utf-8?B?L1FqWjNZTlVsU1NSUmk2eFZIdTMzVW5lbzlmNTI1NHB3T2tqM2RBREh2QjZ2?=
 =?utf-8?B?ZWlHYSsvNi9hUmtrOE12V0RRVk1NR1pGQlZydytkd09SUitPZXk4T2x5dkRo?=
 =?utf-8?B?V25hMEhoTjJSQzZOR1o1THNnVFd4d3lOMHJ3MGVtMVROekxNMnVoaS9iQXNQ?=
 =?utf-8?B?UXdBVCtxVGl2U2MzRjFlWGxXV2VJL3Q5WTAxdlRpd3NORDRRVXVic24rVmhW?=
 =?utf-8?B?VnhkNjQvWFpHOVpxaDREcE9leDNKelJTZXZXWjRDeUlXS0hWcVE0bFlRY3pB?=
 =?utf-8?B?V3hocmUxcHdUS0hjN3JFNWYvQVpCa1NPelRZNkR6NG5VWUJXTWFXRFZnT1p0?=
 =?utf-8?B?UkM5QWE0bnkwVlZPbmlzZ0liYmIwYSsrNVFlZUJnMUROUThjOWVOVU1DdFFp?=
 =?utf-8?B?blhyRlBNTVNzTVp3N1pGNFhLbWhiRjdvQUdVQ0I1V244ZkxRN3J5Y21vckZH?=
 =?utf-8?B?VWNIK2xvTFl5TGp0bDk3MlcyY1dOOUk3d0x5NkdUTzdCRllLeGpYc093VXhx?=
 =?utf-8?B?UE9JejNxZjJ5OVV0bDlMc09GcmozaVZpQjlkL3krQlV1R0JZYllaci9RWXdU?=
 =?utf-8?B?cndNSGpScmJtRjVkYnk3VEZIRmF1MUpzaTVldm01bitJV2hObjBsZlc4Zlpo?=
 =?utf-8?B?clMrS01qK1NkZU5yUHIzRlZ1MUt6d1kwY1UwZm0zcDN4TjZNSjlRT01tVWpK?=
 =?utf-8?B?eHZYdG5Dci9acDRZNC9EYTZFNi9lNlZ4NWMzZTA2czZlaHBVQUhTcjhUOEVY?=
 =?utf-8?B?eTVyVzgzUHZUVnUrdXlhdkIxWmlScC81MVh5TjkzNWtJc0hYMmVaQTZSRVRD?=
 =?utf-8?B?Y2VRTG9DZCs2cU8zN2o5R2l4Z3ZLSWFHbGxtVlBpUUx0dGlVY1dna045VG11?=
 =?utf-8?B?OWpoUUpjYkNDdGN6QVovbmljVzUxMjZhSVFDYWpxWGtZOVFXc0sxVktzZzN3?=
 =?utf-8?B?bE9yL1pNVGd5dnpUVVM0ajQwcmorZ1E4blppc01SWHJRSUxhSnMzMGF0ekFk?=
 =?utf-8?B?VVQ0NWFEVXNqRXg2T2tXQ3NZU3BBYnBPYkI5WG8zbnVNd0ZVZ2RPUGdoUUFm?=
 =?utf-8?Q?GoLm3xZCO4qCQEYmBN3RAiYxz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?LzA3ZzF0NURSUmUyNVBZck1lOXl6eVBKUW5NSVlxeVByMXZkV0xXWEU4cmtU?=
 =?utf-8?B?RmdGUkQ1cDRhakpVMm54V3MrRnlpZmhmNVdzc1B1UFpCczREWjFTcXdLaXNZ?=
 =?utf-8?B?dmVqeC8ydXRINVFFZytCekJXbmtVK0lNZ2NYQkk4UlNVWFAvL21BYzZiQWVF?=
 =?utf-8?B?dDJBa2ZlMXFyYS9WQ04wZW5kR0ZET3RVemllOGp3VFViNEMxdVdWUk9udTJt?=
 =?utf-8?B?dU9JM0pSeHl0TXdkbXNxQkg5MHZCTFo4czAzWGF4MTJaQU9HOTlKNU1ORm95?=
 =?utf-8?B?TGs5V1hZQ1NIKzJZUXVNdlBmQnpaalNoNUxJVldmUC9TREx6WDBDS0l1NUdj?=
 =?utf-8?B?cHlpbk0zVUZjM0NvKzJsSVNleG5UUnNlSWQ5WlN5QzZDb2JaYjg2Mi8zdy95?=
 =?utf-8?B?TU9Fb2RKTmRuKytxUXdvenVwM00rU3RWK0J4U2dxSzJ4ZlU3cXpWME13bnFZ?=
 =?utf-8?B?Q2JkVmgzYTZ5VVNraXJ4UWREZVdwQUorZ1Y0cHlNdlB3aFk1SjVhWGdESTFh?=
 =?utf-8?B?QzN3QlY0L09xWXdrdUNVRkNSVEZaUUVqaU56S3JldEZWV3pveEFPaUx0TUZS?=
 =?utf-8?B?eElpbmpXWk5Hd2huYm50OFhuRTlXYmVQVXRZMFd5bGhKQjdQM3JuNEx6SE9H?=
 =?utf-8?B?eWZvSUdoNktnVlhMT3pkaFpjajNvSy9McFptS1Zma1JSWUEzMjY3ZFcxZzdS?=
 =?utf-8?B?dlJMd1Vrc1NGeHVWdlgyZ1JXV3Boa2cxK0o3UnE4a2ZWU2ozOGRkTXdjQ0Zl?=
 =?utf-8?B?aU45aDlMclY3OXdEeDg1UXJ3dENyZmJhRUVNY0lwVFBNZDEwcHErSHNTdnpz?=
 =?utf-8?B?RHhLc2xiSFpwQk50Q0FsTWx0U2dadWxVZ2J4K3R3NGlsODR3NS94bGkwemtR?=
 =?utf-8?B?YWJCM012aEplTzJKaFJxTm1ZTGFaWFdlZm9KR3VXTHpHb2RtY1B4Yk1XS3pB?=
 =?utf-8?B?MGJzZ2VuS2tHU3lsM28zZDVWYTloUVZrMkZqT1V1azZkYW5NRm5QRjJ3d2RE?=
 =?utf-8?B?M3B2YkNLWmlXdnZSZTZINXM4UXFHR3BOeHFWZDhaV2o2bHIxcExNRWJsZUs4?=
 =?utf-8?B?SHAxQURhaGFLbXprS0tKWlhsV2dWL0EvVlNnZUlhYkovL2ZaZTUxamFiclJD?=
 =?utf-8?B?bk04WTcrMVl4MXV5TG4vSFBKTkppUk0wY3RnK1dLSS9PUVkyS2hyUWxOeFJs?=
 =?utf-8?B?NnVzbWJjSGc1NWlTN3psVHcwNUcvdXJ5ZmNvOFpLWmNMSmhBZEpRbktldFhB?=
 =?utf-8?B?SUtyRnBnR3pydUtQd09BWVRUQ0VqMS9ZazMxQ1grSEdNblFMTytmbnVHZTYv?=
 =?utf-8?Q?8GbJmwqs4EHyc=3D?=
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB7951.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db3d7a2-9fc1-4269-d430-08dbbe7d2e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 10:41:46.5067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D4PWGabY4hbe9FGYPjR4fZe+89yhq7Crpq/Q8taOuJF7tecyfGmZYcvyTTfCs+0BniyiLOLF5AK+u3/jjemSjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7918
X-Proofpoint-GUID: rQsoliTL_l7JUJ4hGEOSk8rChEUxdIsS
X-Proofpoint-ORIG-GUID: rQsoliTL_l7JUJ4hGEOSk8rChEUxdIsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011 adultscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309260091
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
Cc: Jani Nikula <jani.nikula@intel.com>, Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Ramya SR \(QUIC\)" <quic_rsr@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhk
ZXVjaGVyQGdtYWlsLmNvbT4gDQpTZW50OiBNb25kYXksIFNlcHRlbWJlciAyNSwgMjAyMyA4OjI3
IFBNDQpUbzogaW1yZS5kZWFrQGludGVsLmNvbQ0KQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgSmVmZiBMYXl0b24g
PGpsYXl0b25Aa2VybmVsLm9yZz47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdheW5lIExpbiA8V2F5bmUuTGluQGFtZC5jb20+
OyBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+OyBSYW15YSBTUiAoUVVJ
QykgPHF1aWNfcnNyQHF1aWNpbmMuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MV0gZHJtL2Rw
L21zdDogZml4IG1pc3NpbmcgbW9kZXNldCB1bmxvY2sgZm9yIE1TVCBwb3J0IGRldGVjdA0KDQpX
QVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQ
bGVhc2UgYmUgd2FyeSBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFuZCBkbyBub3QgZW5h
YmxlIG1hY3Jvcy4NCg0KT24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMzoyMuKAr1BNIEltcmUgRGVh
ayA8aW1yZS5kZWFrQGludGVsLmNvbT4gd3JvdGU6DQo+DQo+IE9uIEZyaSwgU2VwIDIyLCAyMDIz
IGF0IDAzOjAyOjIzUE0gLTA0MDAsIEx5dWRlIFBhdWwgd3JvdGU6DQo+ID4NCj4gPiBPaCEgd293
IHRoYW5rIHlvdSBmb3IgY2F0Y2hpbmcgdGhpczoNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBMeXVk
ZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPg0KPiA+DQo+ID4gSSB3aWxsIGdvIGFuZCBwdXNoIHRo
aXMgdG8gZHJtLW1pc2MtbmV4dCBpbiBqdXN0IGEgbW9tZW50DQo+ID4NCj4gPiBPbiBGcmksIDIw
MjMtMDktMTUgYXQgMTA6MjQgKzA1MzAsIFJhbXlhIFNSIHdyb3RlOg0KPiA+ID4gTW9kZXNldCBt
dXRleCB1bmxvY2sgaXMgbWlzc2luZyBpbiBkcm1fZHBfbXN0X2RldGVjdF9wb3J0IGZ1bmN0aW9u
Lg0KPiA+ID4gVGhpcyB3aWxsIGxlYWQgdG8gZGVhZGxvY2sgaWYgY2FsbGluZyB0aGUgZnVuY3Rp
b24gbXVsdGlwbGUgdGltZXMgDQo+ID4gPiBpbiBhbiBhdG9taWMgb3BlcmF0aW9uLCBmb3IgZXhh
bXBsZSwgZ2V0dGluZyBpbXVsdGlwbGUgTVNUIHBvcnRzIA0KPiA+ID4gc3RhdHVzIGZvciBhIERQ
IE1TVCBib25kaW5nIHNjZW5hcmlvLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJhbXlh
IFNSIDxxdWljX3JzckBxdWljaW5jLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDQgKysrLQ0KPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90b3BvbG9neS5j
IA0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMN
Cj4gPiA+IGluZGV4IGVkOTZjZmMuLmQ2NTEyYzQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+ID4gQEAgLTQxNTQs
NyArNDE1NCw3IEBAIGRybV9kcF9tc3RfZGV0ZWN0X3BvcnQoc3RydWN0IGRybV9jb25uZWN0b3Ig
DQo+ID4gPiAqY29ubmVjdG9yLA0KPiA+ID4NCj4gPiA+ICAgICByZXQgPSBkcm1fbW9kZXNldF9s
b2NrKCZtZ3ItPmJhc2UubG9jaywgY3R4KTsNCj4gPiA+ICAgICBpZiAocmV0KQ0KPiA+ID4gLSAg
ICAgICAgICAgZ290byBvdXQ7DQo+ID4gPiArICAgICAgICAgICBnb3RvIGZhaWw7DQo+ID4gPg0K
PiA+ID4gICAgIHJldCA9IGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOw0KPiA+ID4NCj4g
PiA+IEBAIC00MTgxLDYgKzQxODEsOCBAQCBkcm1fZHBfbXN0X2RldGVjdF9wb3J0KHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+ID4gPiAgICAgICAgICAgICBicmVhazsNCj4gPiA+
ICAgICB9DQo+ID4gPiAgb3V0Og0KPiA+ID4gKyAgIGRybV9tb2Rlc2V0X3VubG9jaygmbWdyLT5i
YXNlLmxvY2spOw0KPg0KPiBJc24ndCB0aGlzIHN1cHBvc2VkIHRvIGJlIHVubG9ja2VkIG9ubHkg
YnkgDQo+IGRybV9oZWxwZXJfcHJvYmVfZGV0ZWN0X2N0eCgpIC8gZHJtX2hlbHBlcl9wcm9iZV9k
ZXRlY3QoKSA/DQoNCk1heWJlIGFkZGluZyBhIGNvbW1lbnQgdG8gdGhhdCBlZmZlY3Qgd291bGQg
YmUgaGVscGZ1bCBmb3IgdGhlIGZ1dHVyZS4NCg0KQWxleA0KDQo+dGhpcyBpcyBkaWZmZXJlbnQg
bG9jaywgYWJvdmUgZnVuY3Rpb24gbWVudGlvbmVkIGlzIGxvY2tpbmcvdW5sb2NraW5nIHRoZSBn
bG9iYWwgY29ubmVjdGlvbl9tdXRleCwgdGhhdCBpcyByZXF1aXJlZCBhbHdheXMgbG9ja2VkIGR1
cmluZyB0aGUgYXRvbWljID5jaGVjay9jb21taXQuIEhlcmUgd2UgYXJlIHRhbGtpbmcgYWJvdXQg
TVNUIHRvcG9sb2d5IG1hbmFnZXIgbXV0ZXggIm1nci0+YmFzZS5sb2NrIi4NCg0KPkZvciBub3Jt
YWwgbm9uLWJvbmQgTVNULCBpdCdzIG9rLCB0aGUgY2FsbGluZyBzZXF1ZW5jZSBmb3IgZGV0ZWN0
aW5nIE1TVCBjb25uZWN0b3Igc3RhdHVzIGlzDQo+IGRwX21zdF9jb25uZWN0b3JfZGV0ZWN0IC0+
bXN0LT5tc3RfZndfY2JzLT5kZXRlY3RfcG9ydF9jdHggPSBkcF9tc3RfZGV0ZWN0X3BvcnQgLT5k
cm1fZHBfbXN0X2RldGVjdF9wb3J0ICh3aGVyZSBtZ3ItPmJhc2UubG9jayBpcyBsb2NrZWQpDQoN
Cj4gVGhlbiBmb3IgdGhlIGJvbmQgTVNUIGNhc2UsIHRvIGZpZ3VyZSBvdXQgaWYgdGhlIHNpYmxp
bmcgY29ubmVjdG9ycyBhcmUgYWxzbyBjb25uZWN0ZWQsIHNvIHRoYXQgdGhlIGJvbmRpbmcgaXMg
cG9zc2libGUsIHdlIG5lZWQgZGV0ZWN0IHR3byBvciBtb3JlIGNvbm5lY3RvcnMgPmluIHNpbmds
ZSBkcF9tc3RfY29ubmVjdG9yX2RldGVjdCBjYWxsDQoNCj5kcF9tc3RfY29ubmVjdG9yX2RldGVj
dCAtPm1zdC0+bXN0X2Z3X2Nicy0+ZGV0ZWN0X3BvcnRfY3R4ID0gZHBfbXN0X2RldGVjdF9wb3J0
IC0+ZHJtX2RwX21zdF9kZXRlY3RfcG9ydCAod2hlcmUgbWdyLT5iYXNlLmxvY2sgaXMgbG9ja2Vk
KQ0KPmRwX21zdF9maW5kX3NpYmxpbmdfY29ubmVjdG9yIC0+bXN0LT5tc3RfZndfY2JzLT5kZXRl
Y3RfcG9ydF9jdHggPSBkcF9tc3RfZGV0ZWN0X3BvcnQgLT5kcm1fZHBfbXN0X2RldGVjdF9wb3J0
IChibG9ja2VkIGJ5IG1nci0+YmFzZS5sb2NrKQ0KDQo+DQo+ID4gPiArZmFpbDoNCj4gPiA+ICAg
ICBkcm1fZHBfbXN0X3RvcG9sb2d5X3B1dF9wb3J0KHBvcnQpOw0KPiA+ID4gICAgIHJldHVybiBy
ZXQ7DQo+ID4gPiAgfQ0KPiA+DQo+ID4gLS0NCj4gPiBDaGVlcnMsDQo+ID4gIEx5dWRlIFBhdWwg
KHNoZS9oZXIpDQo+ID4gIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQNCj4gPg0K
