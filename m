Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BF3F7C96
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 21:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B686E417;
	Wed, 25 Aug 2021 19:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570836E417
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:13:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ED5325C01B0;
 Wed, 25 Aug 2021 15:13:42 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Wed, 25 Aug 2021 15:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 amanoeldawod.com; h=mime-version:message-id:in-reply-to
 :references:date:from:to:cc:subject:content-type; s=fm2; bh=0Sgs
 63PeGz1VlqfdwjoabMeAWURDTLGiuSSNeI8opGo=; b=f1BXuao40TB/irJmPF3H
 D93sPoEoZ87QhGvmg9cq7TG8AJ+D0WK7sJKZ/IQmExpPfEKOC2AUKaKyKqdw8IuD
 0/7A2ShaEW+ADPo6B5vg3ZhDW8U8/gNAzd7CE2kxdvQGtwIabz1WUiPzYXmdp0vs
 jI01lfFys63dDZcBX4SI2MGQJ5FJWIwRQqiJSHNN0kZI8rhy6Q0YldzIhkRooTi+
 trdrcH59gArnmPLyTW8bjMlBKpKq4BiG6AYkHUmgNJL2Z4p232JN0UvU7H6+DZie
 U7dBMt4OeOamIjX/HFUCxcRr80yoOBu3PR+L4qB1vWrfN8QI/rCMeE1psBRfxoQL
 vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0Sgs63
 PeGz1VlqfdwjoabMeAWURDTLGiuSSNeI8opGo=; b=a5By/y5xT+iIOVvI92ZHJ/
 FE8MZVLKv+X9dqF7V879aMjGSMGfi/cstqe0hftph/TOX/XuGxdyzUtqcYKuiQAD
 +ezQecrh1fpdGpLDPZ/c/QAvCf8smBX4Kh0BD2i+QkTkFXn9sqh/d9gAxxaTfWhY
 IDi7eu0qeilOO3i3DvhP9Aw/WZvl62tCvqjiVdnMMmlCaM1Qn5DMlYCCvss9+mlF
 nmfxxHkrDtXq6jyS7FNQ6OhPFVljtHA3F6zXxw4Csz2Ws0bcYjKHbtLVRHX+tXnR
 pQyZKKzW/wuCDMvLE4EWMepdrTgkiUfdy9aK9It5BCSrCUrtxQX9iZw9suyoYsJA
 ==
X-ME-Sender: <xms:ZZYmYbSiASbwavuKDlBUl6vxpK8KuceYC6btcjV5vPMbguTNcsMlDA>
 <xme:ZZYmYcwaxgQ94KE1KnBHSehvrXeeAc4Zk9BWs23Xw2VuitL7BY1hmEiMTyUtJGRx4
 fvJ_QfahSifw0AZCIk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehmtderreerreejnecuhfhrohhmpedftehm
 rghnohgvlhcuffgrfihougdfuceokhgvrhhnvghlsegrmhgrnhhovghluggrfihougdrtg
 homheqnecuggftrfgrthhtvghrnhepveevveeutdejkeegffejgeeileejheehgfffjefh
 veehueevjeehjefgvedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepkhgvrhhnvghlsegrmhgrnhhovghluggrfihougdrtghomh
X-ME-Proxy: <xmx:ZZYmYQ0J3Zd3AdKd2Ec7ydVcCox4nDA08QyC-Ofh1kaKnskv81g2Pw>
 <xmx:ZZYmYbD0HSJF-GDHYx5u7WWzPKwhT7LcYyu2xVV2eVV4fMv41AdW7w>
 <xmx:ZZYmYUgTG99tUXisY67hlqwokfUk2xDmaUP8_S-LJUwxw66xCPBYqQ>
 <xmx:ZpYmYSdbbqs30D7w7zV2AV3emS5UhOgL7HIJCt_jpsCVJ8ALdGlvaA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A7E74360207; Wed, 25 Aug 2021 15:13:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1125-g685cec594c-fm-20210825.001-g685cec59
Mime-Version: 1.0
Message-Id: <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
In-Reply-To: <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
 <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
Date: Wed, 25 Aug 2021 15:12:25 -0400
From: "Amanoel Dawod" <kernel@amanoeldawod.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?Q?Re:_drm:_simpledrm:_fbdev_emulation_error_with_CONFIG=5FDRM=5F?=
 =?UTF-8?Q?SIMPLEDRM_enabled?=
Content-Type: multipart/mixed;
 boundary=99941a19e2524692b9c6ea412939c813
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

--99941a19e2524692b9c6ea412939c813
Content-Type: text/plain

Hi

On Wed, Aug 25, 2021, at 2:02 PM, Thomas Zimmermann wrote:
> 
> Oh, now simpledrm itself fills up the log with pointless messages. :/ 
> Looking at the file, there's plenty of Gnome buffer swapping. I suspect 
> that Gnome works? It's just the console that's not available?
> 

Yes, Gnome was working, only the console was blank.

> Could you please boot directly into a text terminal? That should be 
> possible by adding systemd.unit=multi-user.target to the kernel command 
> line if your distro uses systemd. Due to the issue, you probably won't 
> see anything on the screen, so you may need remote access.
> 
> Thanks for your help with debugging and sorry for sending you through so 
> many hops.
> 
> Best regards
> Thomas
>

No problem, managed to boot directly into a text terminal and grabbed DRM
related dmesg log.
Hopefully it's what you're looking for :)

Find it attached please.

-- 
thanks,
Amanoel
--99941a19e2524692b9c6ea412939c813
Content-Disposition: attachment;filename="dmesg-simpledrm.txt"
Content-Type: text/plain; name="dmesg-simpledrm.txt"
Content-Transfer-Encoding: BASE64

WyAgICAzLjI1NTMxMl0gW2RybToweGZmZmZmZmZmYzAzNGYwY2NdIEluaXRpYWxpemVkClsg
ICAgMy4yNjMyNzZdIHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVidWZmZXIuMDog
W2RybToweGZmZmZmZmZmYzAzOTc2YjRdIGRpc3BsYXkgbW9kZT17IjEwMjR4NzY4IjogNjAw
MDAgNDcxODU5MjAgMTAyNCAxMDI0IDEwMjQgMTAyNCA3NjggNzY4IDc2OCA3NjggMHg0MCAw
eDB9ClsgICAgMy4yNjMyODFdIHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVidWZm
ZXIuMDogW2RybToweGZmZmZmZmZmYzAzOTc2ZDddIGZyYW1lYnVmZmVyIGZvcm1hdD1BUjI0
IGxpdHRsZS1lbmRpYW4gKDB4MzQzMjUyNDEpLCBzaXplPTEwMjR4NzY4LCBzdHJpZGU9NDA5
NiBieXRlClsgICAgMy4yNjMzMDhdIFtkcm06MHhmZmZmZmZmZmMwMmViY2NiXSAKWyAgICAz
LjI2MzMwOV0gW2RybToweGZmZmZmZmZmYzAyZWJlOTRdIApbICAgIDMuMjYzMzQwXSBbZHJt
OjB4ZmZmZmZmZmZjMDJlYmVmOF0gbmV3IG1pbm9yIHJlZ2lzdGVyZWQgMApbICAgIDMuMjYz
MzUxXSBbZHJtOjB4ZmZmZmZmZmZjMDJlY2M0OF0gYWRkaW5nICJVbmtub3duLTEiIHRvIHN5
c2ZzClsgICAgMy4yNjMzNTJdIFtkcm06MHhmZmZmZmZmZmMwMmVjYWVhXSBnZW5lcmF0aW5n
IGhvdHBsdWcgZXZlbnQKWyAgICAzLjI2MzM1Nl0gW2RybV0gSW5pdGlhbGl6ZWQgc2ltcGxl
ZHJtIDEuMC4wIDIwMjAwNjI1IGZvciBzaW1wbGUtZnJhbWVidWZmZXIuMCBvbiBtaW5vciAw
ClsgICAgMy4yNjMzNTldIFtkcm06MHhmZmZmZmZmZmMwMzE5NTE5XSAKWyAgICAzLjI2MzM2
MF0gW2RybToweGZmZmZmZmZmYzAzMDgyMzFdIE9CSiBJRDogMzEgKDIpClsgICAgMy4yNjMz
NjJdIFtkcm06MHhmZmZmZmZmZmMwMzY4MmEwXSBbQ09OTkVDVE9SOjMxOlVua25vd24tMV0K
WyAgICAzLjI2MzM2M10gW2RybToweGZmZmZmZmZmYzAzNjgzNzRdIFtDT05ORUNUT1I6MzE6
VW5rbm93bi0xXSBzdGF0dXMgdXBkYXRlZCBmcm9tIHVua25vd24gdG8gY29ubmVjdGVkClsg
ICAgMy4yNjMzNzBdIFtkcm06MHhmZmZmZmZmZmMwMzY4NjA1XSBbQ09OTkVDVE9SOjMxOlVu
a25vd24tMV0gcHJvYmVkIG1vZGVzIDoKWyAgICAzLjI2MzM3MV0gW2RybToweGZmZmZmZmZm
YzAyZjBjMjNdIE1vZGVsaW5lICIxMDI0eDc2OCI6IDYwMDAwIDQ3MTg1OTIwIDEwMjQgMTAy
NCAxMDI0IDEwMjQgNzY4IDc2OCA3NjggNzY4IDB4NDggMHgwClsgICAgMy4yNjMzNzNdIFtk
cm06MHhmZmZmZmZmZmMwMzE5NzkzXSBjb25uZWN0b3IgMzEgZW5hYmxlZD8geWVzClsgICAg
My4yNjMzNzRdIFtkcm06MHhmZmZmZmZmZmMwMzE5YjdiXSBOb3QgdXNpbmcgZmlybXdhcmUg
Y29uZmlndXJhdGlvbgpbICAgIDMuMjYzMzc1XSBbZHJtOjB4ZmZmZmZmZmZjMDMxOWRlM10g
bG9va2luZyBmb3IgY21kbGluZSBtb2RlIG9uIGNvbm5lY3RvciAzMQpbICAgIDMuMjYzMzc2
XSBbZHJtOjB4ZmZmZmZmZmZjMDMxYTJjYl0gbG9va2luZyBmb3IgcHJlZmVycmVkIG1vZGUg
b24gY29ubmVjdG9yIDMxIDAKWyAgICAzLjI2MzM3N10gW2RybToweGZmZmZmZmZmYzAzMTll
ZGRdIGZvdW5kIG1vZGUgMTAyNHg3NjgKWyAgICAzLjI2MzM3OF0gW2RybToweGZmZmZmZmZm
YzAzMWEwYjldIHBpY2tpbmcgQ1JUQ3MgZm9yIDEwMjR4NzY4IGNvbmZpZwpbICAgIDMuMjYz
Mzc5XSBbZHJtOjB4ZmZmZmZmZmZjMDMxYTIwNV0gZGVzaXJlZCBtb2RlIDEwMjR4NzY4IHNl
dCBvbiBjcnRjIDM0ICgwLDApClsgICAgMy4yNjMzODBdIFtkcm06MHhmZmZmZmZmZmMwMzA4
MjMxXSBPQkogSUQ6IDMxICgyKQpbICAgIDMuMjYzMzgxXSBbZHJtOjB4ZmZmZmZmZmZjMDMw
ODJlMV0gT0JKIElEOiAzMSAoMykKWyAgICAzLjI2MzM4M10gc2ltcGxlLWZyYW1lYnVmZmVy
IHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBbZHJtOjB4ZmZmZmZmZmZjMDM3Y2Y0Zl0gdGVzdCBD
UlRDIDAgcHJpbWFyeSBwbGFuZQpbICAgIDMuMjYzMzg0XSBzaW1wbGUtZnJhbWVidWZmZXIg
c2ltcGxlLWZyYW1lYnVmZmVyLjA6IFtkcm06MHhmZmZmZmZmZmMwMzdmZGRhXSBzdXJmYWNl
IHdpZHRoKDEwMjQpLCBoZWlnaHQoMjMwNCkgYW5kIGJwcCgzMikKWyAgICAzLjI2MzM5NF0g
W2RybToweGZmZmZmZmZmYzAzMDM1ODNdIGJhZCBmcmFtZWJ1ZmZlciBoZWlnaHQgMjMwNCwg
c2hvdWxkIGJlID49IDc2OCAmJiA8PSA3NjgKWyAgICAzLjI2MzM5OF0gc2ltcGxlLWZyYW1l
YnVmZmVyIHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBbZHJtXSAqRVJST1IqIGZiZGV2OiBGYWls
ZWQgdG8gc2V0dXAgZ2VuZXJpYyBlbXVsYXRpb24gKHJldD0tMjIpClsgICAgMy4yNjMzOTld
IHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVidWZmZXIuMDogW2RybToweGZmZmZm
ZmZmYzAzN2U5ZmVdIGNsaWVudCBob3RwbHVnIHJldD0tMjIKWyAgIDE0LjcwNDE3MV0gc3lz
dGVtZFsxXTogU3RhcnRpbmcgTG9hZCBLZXJuZWwgTW9kdWxlIGRybS4uLgpbICAgMTQuNzEx
MTA1XSBzeXN0ZW1kWzFdOiBtb2Rwcm9iZUBkcm0uc2VydmljZTogRGVhY3RpdmF0ZWQgc3Vj
Y2Vzc2Z1bGx5LgpbICAgMTQuNzExMjUzXSBzeXN0ZW1kWzFdOiBGaW5pc2hlZCBMb2FkIEtl
cm5lbCBNb2R1bGUgZHJtLgo=

--99941a19e2524692b9c6ea412939c813--
