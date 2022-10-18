Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE7602072
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 03:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6D310E141;
	Tue, 18 Oct 2022 01:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net
 [150.101.137.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 08C7B10E141
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 01:28:23 +0000 (UTC)
X-SMTP-MATCH: 1
IronPort-Data: =?us-ascii?q?A9a23=3AJNuO9KrrVYX6iPdh85D/Cixyz/deBmIBZBIvg?=
 =?us-ascii?q?KrLsJaIsI4StFCztgarIBmDbqmMZGukLop1Pdjj80JX6JOAyoQwHgQ//CE2F?=
 =?us-ascii?q?34R9JeYXN7JdE6rNHrOf5CeFBs6tcxEZ4TNc81pFCKD/0enG7Ww9nMUOYOgH?=
 =?us-ascii?q?+qkUrSYUsxSqa6IcMqS4P5as7ZRbrNA2LBVPSvd4bsenOWHULOV82Yc3lM8s?=
 =?us-ascii?q?8pvmjs21BjBkGtwUmgFWBx+lAS2e0/5rX4oDfrZw3PQGuG4FwMhLgrJ5OnRE?=
 =?us-ascii?q?mjxp3/BBj45+4sXfHHmQpaKVeSPokkPAffk2l4a4HUHuko5HKNaMB0KzW/Rx?=
 =?us-ascii?q?ZYrlIglWZ+YEG/FOoXFgvgdTgMeFihkJq1u+bnbLGK5tsCeiUrANX3h352CC?=
 =?us-ascii?q?WlqZtBAobwtXTsmGfswcmtTNnhvndmeyaimTPF2j9oiKo/zNYUSt2t7wDXHB?=
 =?us-ascii?q?PMOSJXPBa7N4Ldw1zcqh9tSHP/YIckeZDxuYzzJZhEJMVASYLo3nf2sh3TzW?=
 =?us-ascii?q?zJdoVOR46Ew5gD75Qh8wLHrPNfPPPCHWM5Vk1ywr2fKuW/+B3kyONWZyDeBt?=
 =?us-ascii?q?GyhmvPChwv1Vp0WEPuz9pZCjEeSg2AeFhASfV+6uuWizECkVt9TJlcX5i026?=
 =?us-ascii?q?68o+ySDStj7Qg39o3OeuBMYc8RfHvd86wyXzKfQpQGDCQAsUjlbdtUiuNQeQ?=
 =?us-ascii?q?T0sy0/MkdT0AzBmrLySTzSa7Lj8kN8YETxNeCpbPWlcWVJQu5+7tNtm1lSeE?=
 =?us-ascii?q?Y04BPXg1puoDW6l+zqOuHFm0u1X1dpjO76TpBae2W/q/MCTCFRpu23qsquex?=
 =?us-ascii?q?lsRTOaYi0aAsDA3Ncp9Ebs=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AOiHc66gyKbEQSI6kVafN6yiq1XBQXtYji2?=
 =?us-ascii?q?hC6mlwRA09TySZ//rDoB19726RtN9xYgBEpTnuAsK9qB/nn6KdpLNxAV7AZn?=
 =?us-ascii?q?iFhILLFvAA0WKK+VSJJ8S9zI5gPMxbHJSWZuecMbE3t6jH3DU=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DOAQA1AE5jAPXKfQENTR4BAQsSDEA?=
 =?us-ascii?q?JhkSEToJijjQDgROeBAsBUwQBAYUFAoRtJjgTAQIEFQEBBgEBAQEBBwQQATl?=
 =?us-ascii?q?SjDgBAQEDI1YQCw0LAgImAgJXBgENBYJ9rg16gTIaZ4gegWWBESyBZooPHYQ?=
 =?us-ascii?q?hN4FVRIEVJw8NgjA3PoQiAQEgg1c4gi4ElFiCHoNzOAMZKx1AAws7MwMVAxQ?=
 =?us-ascii?q?DBSEHAxkPIw0NBBYHDAMDBSUDAgIbBwICAwIGEwUCAhc2NAgECAQrJA8FAgc?=
 =?us-ascii?q?vBQQvAh4EBQYRCAIWAgYEBAQEFQIQCAIIJhcHExgbGQEFWQ4JIRYGDhoNBQY?=
 =?us-ascii?q?TAyBJJgUKOA8oL2krHBsHgQwqCR8VAwQEAwIGEwMiAg0pMRQEKRMPLQcjcQk?=
 =?us-ascii?q?CAyJlBQMDBCgsAwlAByUkPAdYEigBBAMCECI8BgMJAwIiWXYJJhEVBQMNFyU?=
 =?us-ascii?q?IBTcaBAg8AgUGUhICChEDEg8GJ0gPSj45FgYnRQE2Dw4aA50oN4EJL14Kgh0?=
 =?us-ascii?q?CwU40B4NjgUQGDJ5vIwuDdoxRhksDjASFdpcWIKlNgX4zGi5vAYI8UZ0rYjs?=
 =?us-ascii?q?CBgEKAQEDCYpXAQE?=
Received: from unknown (HELO [127.0.0.1]) ([1.125.202.245])
 by ipmail06.adl3.internode.on.net with ESMTP; 18 Oct 2022 11:58:20 +1030
Date: Tue, 18 Oct 2022 11:58:06 +1030
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm fixes for 6.1-rc1
User-Agent: K-9 Mail for Android
In-Reply-To: <f3a5b249-84d8-9ba3-9977-3557c82a7850@amd.com>
References: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
 <20221016080833.5503-1-user@am64>
 <CAPM=9txsBf5HJ97tAMOQ8PdiPciK-zqngERUm7hGJO8Zyyqb+w@mail.gmail.com>
 <C98B32CF-86B0-438D-BC8D-10FA255B3B4F@internode.on.net>
 <7c645fa8-bf29-4b30-bdc5-e61e6bb09927@amd.com>
 <f0110d36-a9c2-c1b9-b193-32da4f98a975@amd.com>
 <67e2904a-4b80-5173-2d8f-6a3d1f702fbb@amd.com>
 <CAPM=9tz8=iDye+vYai2NLLW-u3TfZ=DKdA_h2e+kk==ZO7q3PQ@mail.gmail.com>
 <50dcf794-e96f-24a3-5d40-6c64941b1bc0@amd.com>
 <f3a5b249-84d8-9ba3-9977-3557c82a7850@amd.com>
Message-ID: <EE5085BD-98AF-452E-9AE3-4EA81E2A55E1@internode.on.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, daniel.vetter@ffwll.ch,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Arunpravin, your patch applied to the 6=2E1-rc1 code built a kernel =
that loaded the amdgpu module on my pc with Cape Verde GPU card with no pro=
blems=2E

Regards,

Arthur=2E=20

On 18 October 2022 7:10:45 am ACDT, Arunpravin Paneer Selvam <arunpravin=
=2Epaneerselvam@amd=2Ecom> wrote:
>Hi Christian,
>
>Looks like we have to exit the loop if there are no blocks to compare=2E
>May be that's why the function returns false=2E
>
>@Arthur Marsh Could you please test the attached patch=2E
>
>Thanks,
>Arun
>
>On 10/17/2022 1:39 PM, Christian K=C3=B6nig wrote:
>> Am 17=2E10=2E22 um 10:01 schrieb Dave Airlie:
>>> On Mon, 17 Oct 2022 at 17:07, Christian K=C3=B6nig <christian=2Ekoenig=
@amd=2Ecom> wrote:
>>>> Hi Arun,
>>>>=20
>>>> the hw generation doesn't matter=2E This error message here:
>>>>=20
>>>> amdgpu: Move buffer fallback to memcpy unavailable
>>>>=20
>>>> indicates that the detection of linear buffers still doesn't work as
>>>> expected or that we have a bug somewhere else=2E
>>>>=20
>>>> Maybe the limiting when SDMA moves are not available isn't working
>>>> correctly?
>>> It is a CAPE_VERDE, so maybe something with the SI UVD memory limitati=
ons?
>>=20
>> Yeah, good point=2E Could be that we try to move something into the UVD=
 memory window and that something isn't allocated linearly=2E
>>=20
>> Arun can you trace the allocation and make sure that all kernel allocat=
ions have the CONTIGUOUS flag set?
>>=20
>> Thanks,
>> Christian=2E
>>=20
>>>=20
>>> Dave=2E
>>=20

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
