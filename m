Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8029B8030A6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AD210E334;
	Mon,  4 Dec 2023 10:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04olkn0818.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::818])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C0610E14F;
 Mon,  4 Dec 2023 09:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVh87JtCuiSxJ6paZO51Q/Q3xckY9rGKhzvrlGLJWZzDtb4Ffayf8eA5b8P7VujpV2apZvUFGCOFpcHA3JO2hYp5XgiqFePoRgXXbA8Y9HYH1J99DxAWsZoBRXw9OZAD7BYgcW7KLlXQW/rVkBTFifvBU2JK7V0ohlweN3IzF3Iz7vdG1XAtpzUn6e7VzTQ94g+mDEq6FGwoSb/nVEYnu4zmOEOAoIzmkiA7WaBxWZBIys+PpgbkhLNEI+GdoRwv6Kg+Q9cALFn/KieC6M/1PSGXcpVQJ2qt3oOjLev0CLWFs+nRd69YUffeXPvx+CP7oCcKb0uPLFZ+ToEJblsPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSRKFeX11ALtc4DWYo74WMF4MhGRbSjv9T6obHItYqA=;
 b=gyi1asmf5NAfUsY2GI1ScWArG9PZpo9oWBbDYxrWQOe2a3qeo4e5G7SjJv5y+hW0VqPwODm9xz2vRGGHwu35DNPChhsKwY8KlWNldxgqjMaEGw5JUhqS5+rV2ctX0LfHE1Fy5yihB5EokKhKG9MSr8hmxGeP93V/x33hjv7WoZFCOQvfKMHCFXf8aqk8pGnUENT7ahb6QSDIoOOC4b5lS6lIS+UbTYxHJCu6kNzqqbqfIUt+nXEoaIjGmAp0WC+ImbgPXtShFx538THtNH+zj3nmL/KgM/A2ANfWXXZEdonTFidQBUpM7Rvebf6+U/uMc/Rcgt35sSlTQ4mWoYwRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSRKFeX11ALtc4DWYo74WMF4MhGRbSjv9T6obHItYqA=;
 b=jVIzlvBmCcoVsxAKSjHT8M1BmQt5CqGv4OPo7QYM2VD5wwXo6v8QRFC6XQZpX7K0iS9SMkjG6w49VIjsmCxvZs162YrMm4/m9YCunbCWoMIYMcYcFheM/oHTTuE48Tb/z/xe6iMIax3ONMQasOHJ/g827E7hjxAub6wAA2GBbInURMAt6QQijmqa2toYVwnh/qoXBrr8noywlGiUJFL/J6iawHtHNbx3FJgNbhLZ0+EB63t3eeV5eO/B2plrAVJR5bBCRASekFhqoe731O1GF+fKGBT5iCEXNgYDvfr91tSAbFO+whe4O7Ve3NrJ+Rte9aBi+WN92HK3SPnNwx0JDg==
Received: from AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:172::24)
 by GV2PR10MB6043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 09:51:27 +0000
Received: from AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fc4:7df9:3d95:eb28]) by AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fc4:7df9:3d95:eb28%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 09:51:27 +0000
Content-Type: multipart/alternative;
 boundary="------------HA840JhN1vZdbRgLxjXR55lP"
Message-ID: <AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
Date: Mon, 4 Dec 2023 09:51:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] Kernel problem with multiseat on one card
To: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
 <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
Content-Language: nl
From: Gert Vanhaerents <gert.vanhaerents@hotmail.com>
In-Reply-To: <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
X-TMN: [1DPUg5eiHiLEaNexU8zwBsbq0OqbQa3a]
X-ClientProxiedBy: AM0PR10CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::23) To AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:172::24)
X-Microsoft-Original-Message-ID: <b09af675-3d0e-447f-86e3-3a37fbe51e6d@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR10MB3923:EE_|GV2PR10MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fd448a-0aed-42f2-af34-08dbf4ae9550
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iLakt7l46XD//M7nKAmCmdyLmr+r7fr9rq1xwUJtGaZy8IoWlHGR2UPsC+IwLK58VEL5LuswvlanjRzkj0Bv33WYjgkMiVVZHtVbEv2khoXKDQz0DcwcmqDn4vW2Y0EgJcQBGdlYX4QGkB9Jf1plPbn7ZYcCwlXjEvDeDqaWYk5jbVWAkDuQtVcxwUUg/r2Eq8lOhc8SQSOlvNEygby+MtLGsdPD1Lv4D/K6dJWkX5X9rO7T/efc7dfirnQZgvXd6TAdmtnogVGgI7/6mTwYGcvg9Mt9gaRJ33y8N3dlofviXSn6TfHwz9Jzo0ECWpcyme4cTOnYK+Xk7s4IjissnjnSK5tQPqgejrEZYaqbjpK3uq8kZP+tSFjhpU0KZx5fmerNoNJaNuFCr3ByKfJdTlzwXzKm17Anw6QD6xEJamxILBuD6ORPe5WVw/K4LJPOq4MeZVTZzL5pAVJVuuQFvANmOHiUqQZ1+OhgdSNyNsLCL5C2k7T8tEDF2zCgC2G5HLJwzkBYvBMMlV574KjCAA3zdBlm19iST7NmbgWdYXAesynBHtknY70hYVrnAHs4xjuXrA826iIKym+kgLj90MlyYocYN60S4L0KdaPICEPfcc5KuwKMg3xjyqnOsb4z
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlBXMml4MjBNZ01jalBZandaSytOa0VEMFZmVFkxTElHanNrUk1YTUlDT2c2?=
 =?utf-8?B?V0hiQnhnM0I3djFRT0lIR1pyWFVlNHZwZVV3NDEvWW4raEFKUnd5U2NKYm4r?=
 =?utf-8?B?WkJ0Qmw1VU9mOXo4ejBYUmVuY2MrR3BSaElUZHFJaHRKUWlSK2U5OVk2ckRM?=
 =?utf-8?B?QktMT2x4RHgyc3k2dXRBb2JOalRLTll2RloxclZ3aHdwTVQ1K05FU2U4cUVk?=
 =?utf-8?B?aE9ENjUwbWErOUorWVo1OS9VTkNsSHZadGRacDVmRUxFbnNyWGtEbW00Sk85?=
 =?utf-8?B?UHUwNW9SNE9xc1EwWmcxSGlVVkVNcGY4dUFUbFY1OWRmWE5pNEt6L202MnZG?=
 =?utf-8?B?dWpKcjJoNGxLSXVSQ2tVQVFGR1dsNGhBMmU4MnVrcEV2aUhYM2NLbDhEZjQy?=
 =?utf-8?B?MUtjeXZoZTZlM25CaHhpUlF3NDE3WnB1RVRwVy9yL3FoNUlLYmFDei9OK0sz?=
 =?utf-8?B?VUplZEhMYzFNVURYK1J2cndVajZ6RTBuZVdwUGR0QUFiTzlkWDNDL0dkMW9x?=
 =?utf-8?B?MHpLd2I1YzErTTh5bjdqUE5ZWDVJcm1QeDFkMjZucVBvUFBjaFdrMTVkL3pL?=
 =?utf-8?B?dE1vanVZeUlrSEJFaWhpSVRsamJmT0lCYnBHOEZQV2lMN2g1TEo1VFo5Q21M?=
 =?utf-8?B?YUFVOHkwR0NCaEpCR252U0IyV2RIdUxreCtCS3VaZmxWUUpxRFB5S09Iem5D?=
 =?utf-8?B?NFlnUUZIRlkxNVhVNy9seVJ4ckJIR3dMeTkxZk16c2tFQmFkdW9OVjVwUFlZ?=
 =?utf-8?B?NEg3MmUxekJPbkdjeHpkN0tBRW00Z1JhdTkyeTF5dW5kT0JKTUNFM2dqeWp4?=
 =?utf-8?B?VzN4Ym82YUdYUWZ0UjBmcTh6dEoyUVptRnZ1RktFaVpoU3VjSENiOWdqN2tk?=
 =?utf-8?B?Q3gwQkMydDBmVHl3bTlNTjc3YVhMRmU0dGEyVHJ4VElZNlBEeWlPdFdJa2N5?=
 =?utf-8?B?UUF2dkE5ak1RUlVyV2xmcjhEZVRIeC9Jemt0V0poSlp2dlB2ZHkyVVQrWFRa?=
 =?utf-8?B?VmM1ZytIZkRwT01hUHE5amRvK2doYnNTcWNGdllVdHZEOHJ5ZWVaU3lRd0Zu?=
 =?utf-8?B?aUxkMUg3ZEo2K05QMlR5TllmMXpLaVpHNEkrZDgzR0Z6c2cxZnFEc3pvWi94?=
 =?utf-8?B?QThGN3J1bGpyNXprZnU2bzFmOTBrYXMzYmVid1BpQjFUTzhQVnQ5aWN1aTMv?=
 =?utf-8?B?S05TakJxOWY1dzUvWEtERmIzOWkycVoyQlVMQ2l0UWtuVWtOSGJkUkZUUDBl?=
 =?utf-8?B?REN1NUkzTkRJejJ5OVI5T1JPTDBPd1RBVVIyRXdVSU02dERldGMvQ2JNMkpa?=
 =?utf-8?B?UzZPeXAxTFkvZytGd2x5NGVJTEhWeUdzTVJxSkdJZkZycWdNWkowVVplUk44?=
 =?utf-8?B?Lzcrd0NmcFQrVXczVzVESmN6R2VucnpFVCtURURGQWdMbHdHazMza2dGNExF?=
 =?utf-8?B?TFkyejlQNDk3THpWdnMxQXFoSW9NODVGTlgvL09hZjJXUmFCWFpFZE1sZkU0?=
 =?utf-8?B?SlNwc01pRlhKL01VWEN1SHFTelJQYXRGV1VtcldTRlNFaTJ5cDZDcnJPQkZ6?=
 =?utf-8?B?aFZZT0MwYkI0ZFA2aGpVTXpVVkoyaktiMjdpcUx5RTNPcWNpa2VqRmpZVFgy?=
 =?utf-8?Q?C0oGomi/39Fz0D0ejFb6UVI3UutZFOF1HF6qtK13DoqY=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fd448a-0aed-42f2-af34-08dbf4ae9550
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:51:27.3764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6043
X-Mailman-Approved-At: Mon, 04 Dec 2023 10:39:19 +0000
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

--------------HA840JhN1vZdbRgLxjXR55lP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Op 2/12/2023 om 16:28 schreef Timur Tabi:
> On Sat, 2023-12-02 at 20:18 +0700, Bagas Sanjaya wrote:
>>> When i install the proprietary Nvidia drivers, i have the following:
>>>
>>> [MASTER] pci:0000:08:00.0
>>>            │ ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
>>>            │ │ [MASTER] drm:card0
>>>            │
>>> └─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/renderD128
>>>            │   drm:renderD128
>>>
>>> ─/sys/devices/platform/efi-framebuffer.0/graphics/fb0
>>>            │ graphics:fb0 "EFI VGA"
>>>
>>> So no VGA, DVI or HDMI items.
>> Then report to the GitHub tracker [1].
>>
>> Thanks.
>>
>> [1]:https://github.com/NVIDIA/open-gpu-kernel-modules/issues
>>
> No, do NOT report this on the Github tracker!
>
> That github tracker is ONLY for bugs that occur with OpenRM (the "Open GPU
> Kernel Module") but not with the the proprietary driver.  If you have a bug
> with the the Nvidia proprietary driver, that must be reported on the Nvidia
> forum instead:
>
> https://forums.developer.nvidia.com/c/gpu-graphics/linux/148

OK  i will report it to nvidia. But with the nouveau drivers it's also 
not working. Are you sure it's not a kernel problem?

Because according to systemd it would be a kernel problem.  (personaly i 
am also thinking it's a driver problem)

--------------HA840JhN1vZdbRgLxjXR55lP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Op 2/12/2023 om 16:28 schreef Timur
      Tabi:<br>
    </div>
    <blockquote type="cite" cite="mid:655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Sat, 2023-12-02 at 20:18 +0700, Bagas Sanjaya wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
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
        <pre class="moz-quote-pre" wrap="">
Then report to the GitHub tracker [1].

Thanks.

[1]: <a class="moz-txt-link-freetext" href="https://github.com/NVIDIA/open-gpu-kernel-modules/issues">https://github.com/NVIDIA/open-gpu-kernel-modules/issues</a>

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No, do NOT report this on the Github tracker!

That github tracker is ONLY for bugs that occur with OpenRM (the &quot;Open GPU
Kernel Module&quot;) but not with the the proprietary driver.  If you have a bug
with the the Nvidia proprietary driver, that must be reported on the Nvidia
forum instead: 

<a class="moz-txt-link-freetext" href="https://forums.developer.nvidia.com/c/gpu-graphics/linux/148">https://forums.developer.nvidia.com/c/gpu-graphics/linux/148</a>
</pre>
    </blockquote>
    <p>OK&nbsp; i will report it to nvidia. But with the nouveau drivers it's
      also not working. Are you sure it's not a kernel problem? <br>
    </p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Because according to systemd it would be a
            kernel problem.&nbsp; (personaly i am also thinking it's a driver
            problem)<br>
          </span></span></span></p>
    <blockquote type="cite" cite="mid:655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com">
      <pre class="moz-quote-pre" wrap=""></pre>
    </blockquote>
  </body>
</html>

--------------HA840JhN1vZdbRgLxjXR55lP--
