Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E23898030AA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731BA10E335;
	Mon,  4 Dec 2023 10:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05olkn2098.outbound.protection.outlook.com [40.92.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C7410E2E7;
 Mon,  4 Dec 2023 10:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3G4JJWC/3v7frtGCbLqsbqxAWuhWiWIUJVOPHGHwXGBJgP8MLY0VFw7Ua+87aOmLWWmpwBT4vN6qrHYVa1iev7RaK08ab5aAVXUtKv9agpwDRDNYyIg1A4lwlIT5hBUh/VKb6SjO0jYNd77RyWsAJr7wBvuxgCZiqMLQwUBmmHoESw/M4/b9s2fGt9FPzG14a9aMywmJYjgs4cxAI+3MJ/04lVao/Xo5RzLVBhnMHBZ5gcB9fWmA4zCZvnsxwLqQ8mChv+QOlBGuqrvp0PKQ+2V1l3rCUloj0kZUNNMYEU7iNLG8mQrlOS9NnCXv8VcdrGYMeSbb1w/WCkTOO7bEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwBYJ2m/sO1ZmJVp+1NVrRJtsaiUDH0SP1t/QDw46t0=;
 b=GOKj6aFk6jSX9IlryQw+0tk3XC2HkNXnXfPp4uNNEpPM2ZIDwQjMQ3KBC6zPjyC+LljGtkQzH5f/qmIHSiHK0OQfZiLFF1mCe53zMkt2VLK8vi2/vGDJklGOTnGG/NwYt+9dOO53AQaowY8JNKsMGWfyDf06Lq6K0pedhVIhQZo+2QYgdhUEWwqhSlaGVYYwk5ZVOcT1Vo6B8/bdP2UQbeHrH9xy7n+sZS+BEJMNG21Z2DptZy+81pIw5ax04hdhweFIhUbI3BJ39axEiUrut6jTHBFqTR1aJrk2xfKJ8ocRMm79D911kZEB8dIBVgxHnOg5uEw7nqHJvhAX4MRZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwBYJ2m/sO1ZmJVp+1NVrRJtsaiUDH0SP1t/QDw46t0=;
 b=pgBD1QGsXIwaZSON6ZGajIqZp9eaPDplI5ThrGEx3G4WKD06LeJJGspOlk2sj3Jzl5p88cRF394tO3RB95SQUjEql7MFWIhSRfW6Twqs08N8m8uMw+1gitBwG/KLcTncqAmkm2GQdGtDBfQPlXUFSIjscKdnF6vLRlxeG9JFxT0/M7NsAuWVSJyXF9S70QDpiAUofV/Jq5a8NpUWIqJdOhI7ReHfVyBYc73Y1YplSJV4SfvggXO9RFc5Brsngu1djJWLbyoTq12rn+lssy9nZpsQHOrDdvL2U4N9XlzNx8H0ZtGLAa/hExqMBOW4oxFZmxFyJOQ7K/sFAmrCCUuzig==
Received: from AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:172::24)
 by DB3PR10MB6762.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:43b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:11:35 +0000
Received: from AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fc4:7df9:3d95:eb28]) by AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fc4:7df9:3d95:eb28%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 10:11:35 +0000
Message-ID: <AM7PR10MB3923C9053FCD6D6FAE3902C28E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
Date: Mon, 4 Dec 2023 10:11:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] Kernel problem with multiseat on one card
Content-Language: nl
From: Gert Vanhaerents <gert.vanhaerents@hotmail.com>
To: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
 <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
 <AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [AdW5Ab5Y9ISiQEXEi9X8ROflogfqaNSd]
X-ClientProxiedBy: AM0PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:208:55::36) To AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:172::24)
X-Microsoft-Original-Message-ID: <d8dd837f-0d40-42a8-a580-29532fb1519a@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR10MB3923:EE_|DB3PR10MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 782bd173-2b1b-4835-e1a6-08dbf4b1657a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Kh2G6RTZR346nWMXycvtLV4w5YChnEbsoCKRAzwQxpPYfGc/SfvIjz3mos0M7meK8XTxPVCtdTGfqV8Ovy6Y7+Ux8fHKzB96s1AXFghe+zxWLQxL2+WXptJutm/wpBJ5DwxMIAWwAJhdlIvIpQILIGVUEWHV3B6UKqCSxkmCNIUn2xNGRplJCqzzNKciyfcItl3FnNNyIUduttHrmdoA/6TG1d9vrCnwnAPVK5R+7Fyk7KqbYQ30Z/hO0HlxpmRPjtMZZjc5CU5BoukrpVUUfnkcqFW/A34NaeIQgeX4bLccYF9ZKWV2pCnInOE6Cxa6vqraERkflzihWxf9HJgAW2n9oEAVsM4leBMRyGRmZ7DcT1McEyg9ayqUFfLOlIKs0FkX6U2xR5/HGD0AKF9we1fXi3cd83vU4iYrN8Gt0gNowv2C+TZPShhEJoLE/Xo1IStLPj6Vf+xGADUnWtx7nrehx/J4zXWyN0MfboYJfJosTLc9q5+Dk9wAOS2nhLgfCAlm7GcZsnog3ti7NMKYEbVFF9Ytj5Ot9VXzA/qlnE0iujIUEaTvbzRplAwn+YPeSbSE+THI9pYNls18Ub7vcZUybkHOHReCXoS5E51Nv32I/l5vFYc7Eh+GEE3JdQr
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWpxSEViM0ZzVDRVY0VBSktFZnFnMlVaUEhub1I5a24zSFZZbTY4UmlXVExK?=
 =?utf-8?B?SW1LdWt5ZHJwZjdpeU1xN1J6ZDhTUHdCcHJqVUVrdmRUc250OUM0UHAweGJP?=
 =?utf-8?B?Z3lwR1k5UFZUd3YvN2pNSDAxNEFBdk00eHFoN1JXYmFOSnBoTmRjRm9LUEVP?=
 =?utf-8?B?NC9XRk1lV1E0TW1VZHpFQ0JNZVRmajFNQ0QzRnJJbmFQeG9uUjFGNmRvbTR4?=
 =?utf-8?B?Z1pDNkxqWEFzd0hXakdEaTRZM1FqZFAzUkdqdWNXN25aZGkvYzAwTEdId1kv?=
 =?utf-8?B?RncxcUc1VkpuQ0w4TDhPbFZVNzNzaEZpbHltd0JQdmt5Ti9Zd29TQVJZVHRn?=
 =?utf-8?B?cHpKMGI4MjVXMzI5ZDMzRE1acXZaOERtMEE5M3UxSlg3bmNUb09EdTRJTGFh?=
 =?utf-8?B?WFFGbjE1TUdtZEZUYzJiUDVVc1Ezbzl2dGU1REhzSlFFT05JYTAwZ3BKR25W?=
 =?utf-8?B?b0NWMGZTdUZ6bVNOaXRyVnR0eFB0cGFoRTgvejU3NTFVc0NpZ2MrY0Yyb1Fw?=
 =?utf-8?B?S0FsZkcvdTlvaUpIS3Nja1lEUU5RQk5WUnBvU2dWUjlxTWpySDJRVlBtZm9m?=
 =?utf-8?B?UnZ6eVNaR3V0c3lMdTE1N09DR3dHcDhxVnNXTDNvcjFWZS8welJIMEtUYnpM?=
 =?utf-8?B?ZUdxY3M2T1VuV1Vwc3hGYmJvWjJaK1RPa24zQmtJRVZnTm9xM1IvcmpWMmFB?=
 =?utf-8?B?Q29UakZ0UzN3UnJRMDVJWGNrNHROeXZPdG5NajA3RUx4TlRnajFleTdZWnFz?=
 =?utf-8?B?UFRJMnR3eUM0YWR3eFZINmJuT3c0bXczaFNYMG8raGswakwxaFlzYVhHN01l?=
 =?utf-8?B?YlkzM2JhbFdyczc3REhiUDhINm5QRHU1aGNqcURzWHVOdjB5Y1dYRkg3TVBQ?=
 =?utf-8?B?N2t2QTBOeVh2RktsUGNma2twbGJodUJuY1BXTzEveHBhZWlibkkrdUVCKzBL?=
 =?utf-8?B?M3FqYnppMWc0bDJlYjB0bkR6cFdBemNpcjJUYkErVE0zMUZTd0lWWUVxSGYw?=
 =?utf-8?B?aUpkMy9PNlUyZC9hSVZaVmFBanE5bkg0YW1WaTBCdTgvUi9mTVJwNjRIZXBs?=
 =?utf-8?B?UWM4QVpYSHRkbWtGTm1SaGhxb3pSclE0bDkvaVdwWGc3ZmFoUGoyZTN4S1A2?=
 =?utf-8?B?QUJ1TDdjeDNiL1dYQ2hiWTNPbm1GLytWZmd0MzEvVjNXcTNNS0ZBd1BsckF5?=
 =?utf-8?B?emw3aUwzcmNPSHhISnBTL0RJbU10Q3NIS0VhVUVNekxsNzZVZjhhbDI4Nmhw?=
 =?utf-8?B?a1h3ZXhzdEdKeTZrS1hFaFdzMW5ONWJNb0hLcnNIUitBWlZrSHA3ZnUrakpi?=
 =?utf-8?B?U3NISTNHTjQ3dmZxM1NEQnRwUkdtV1ZsMzZwRFJPeTVTUGFwZWtqN09GdHFR?=
 =?utf-8?B?bzZwZ0MvTmR2RnQvaTJvems4YjJxT01wdjJFZTF2MWZKSy9hRm01NXlhZ0tp?=
 =?utf-8?B?NFRWLzRQdjZydFVFSE92K0hhY3JWeG4wWXpZVTdlUDFqMEllclNMYWVJamtq?=
 =?utf-8?B?QWEveVVnZ0FPalhEY1dkM1FBc3pUZmw1VjVUbXJjcDg0dS9rSUhsTEQrTkly?=
 =?utf-8?B?aWRvZ1NhYk84UzVuYmVvUHpaRkdWaFdSL250L0VQSmhXTFpLbHNCdW94THEz?=
 =?utf-8?Q?j+Dise4L+bNR4ESmMLs2BQidsOiTRSiLy93sbf5OwKfo=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 782bd173-2b1b-4835-e1a6-08dbf4b1657a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:11:35.4773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6762
X-Mailman-Approved-At: Mon, 04 Dec 2023 10:39:24 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Op 4/12/2023 om 9:51 schreef Gert
      Vanhaerents:<br>
    </div>
    <blockquote type="cite" cite="mid:AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">Op 2/12/2023 om 16:28 schreef Timur
        Tabi:<br>
      </div>
      <blockquote type="cite" cite="mid:655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com">
        <pre class="moz-quote-pre" wrap="">On Sat, 2023-12-02 at 20:18 +0700, Bagas Sanjaya wrote:
</pre>
        <blockquote type="cite"> </blockquote>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">When i install the proprietary Nvidia drivers, i have the following:

[MASTER] pci:0000:08:00.0
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │ ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │ │ [MASTER] drm:card0
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │
└─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/renderD128
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │&nbsp;&nbsp; drm:renderD128

─/sys/devices/platform/efi-framebuffer.0/graphics/fb0
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │ graphics:fb0 &quot;EFI VGA&quot;

So no VGA, DVI or HDMI items.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Then report to the GitHub tracker [1].

Thanks.

[1]: <a class="moz-txt-link-freetext" href="https://github.com/NVIDIA/open-gpu-kernel-modules/issues" moz-do-not-send="true">https://github.com/NVIDIA/open-gpu-kernel-modules/issues</a>

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No, do NOT report this on the Github tracker!

That github tracker is ONLY for bugs that occur with OpenRM (the &quot;Open GPU
Kernel Module&quot;) but not with the the proprietary driver.  If you have a bug
with the the Nvidia proprietary driver, that must be reported on the Nvidia
forum instead: 

<a class="moz-txt-link-freetext" href="https://forums.developer.nvidia.com/c/gpu-graphics/linux/148" moz-do-not-send="true">https://forums.developer.nvidia.com/c/gpu-graphics/linux/148</a>
</pre>
      </blockquote>
      <p>OK&nbsp; i will report it to nvidia. But with the nouveau drivers
        it's also not working. Are you sure it's not a kernel problem? <br>
      </p>
      <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Because according to systemd it would be a
              kernel problem.&nbsp; (personaly i am also thinking it's a
              driver problem)<br>
            </span></span></span></p>
      <blockquote type="cite" cite="mid:655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com"> </blockquote>
    </blockquote>
  </body>
</html>
