Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA853338EB4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 14:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9A86F61D;
	Fri, 12 Mar 2021 13:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic302-21.consmr.mail.ne1.yahoo.com
 (sonic302-21.consmr.mail.ne1.yahoo.com [66.163.186.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA506F61D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1615555523; bh=yBjd6lCwLyHdAig2A9M0FY97Qh8YptHsaQstJ73n4Wo=;
 h=From:To:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=UhK4fDCAoROJt+rW1rvQwae44wdbeyBILMCJs+l2ntZnv6KHoDDKB2nzuDdCShOszASJ6ksD5JbhKe51Dexvfar16AHDBByY6OG8j6lKfzp/DTL7Ltryskl3iyNC05dBRScTIpIixwRbmPmGjpuE5Lxd7b4ou7xSVv+Gz6BXpQoKSBs9iFeJpycQJZ/6MdMJwa9KzTnW6++4SEcX0S+/mRLCMsmK5LqGjCTn7mvEq/pY4CW2BpTQ0UREAKQToodOPQAIVM0w+HXOYXd5atm7kX2GXhqLWKkTaKz0Ycs+jH/vFlFtze9fo+aqb/1v5y1CUluTz50foOUs59YA3JcCHg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1615555523; bh=8DlbvgWMOFQVJNJ9+dNfeaV0KsKVFulobvrAgfX5mfa=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=unGy7etzCYnPdjBVx7XVmKxj6bJVIMwiQebf1OmULJ2fskNkPoMCYYeGcFuvw1BqNUu39ZLZ8vlxFhtwzravJJkHfakirtWqdqOMaOxUl8nm+J3xuyt5vaw7yLeWQpfeA7TUKDdR8715GGbqFJ+pNWep07zYgXzXcvdIwjfI7rGSI2BOt3c61h5hIh7UdC5M/lXvfJoGqQ/UNicOvtQR6XaT++n1Yc+C7o9FDYXbgmhQN4I3OhP9TH0JbxE6+PNl54CmKjI9fNdwW2/X0lAZIHTnZl22lRG+6HdMqx9ZW1HcguAtIRIcLRLs+EgR9j+FweXflqYYB8TgPl7WQsdwFA==
X-YMail-OSG: Tj9IFckVM1mGT5rsLa11dcjmtw2jzSHSL.s3s07TlU4JCXL5t7piKGjhlRHzL.9
 nqVZI.GiGFuaifYNGweCu0R4.DEiETEG1L1_4NQxPbky4cjz9ut7nV4D_0HQkLf.R78rXXyoHNaJ
 Ep1lHm4L37VOTweHV2Pjihi4SjSKVZSvufsLmZCVOHEzNU67S_EzU_ohyumgjrsBbhcGUNuWHVdB
 nxfmCMY.6hMehQFsesDukZgmzMHA2PmuE6GHS1b0SRCRxdG2n1C6u2t_S_nvKb3q5aQCwKyUF_O1
 I3ME7t5CU6aGC5Rb3D3.wlxJY4a22hOdPKcUlndG02gbstkNOPAnDAqG7UzJvd0kqLpNSI4gE6oV
 Eb_IpAtfXBztdlOsVXZkghFsbHEezsBZ9owVqXOBgpPSxFE4Ah4LIxwEbSxqJdGlVBMk8xnZRkpD
 AUmgHZjgmHcIKU3BJqX4fEnZgqsAF5U6y484h31QsLJpjMI_AvqOTKN0uA48dMEs1Yux458NRtUQ
 hvbsaT_zvGzDYqBdXIUJCJjFSA_K.WUDbbLjlBeFi_8Vs8rAhNq.bd4nU.kGdLdtUQlWWr_wot8i
 Jz2OkiRI2fUMBvejNaXcCq6399gFmMqbLlqNf_9CFukNU61rpELU0JAe.BxkoBkTk6vwM2R0Jd_F
 Ddqo.Ei3JtzHMgajLFNNqCILvMyOUD_My0bZJDRqT4Vde2.vQZZaXtrnP9XzWr3cKcMzGHbELHId
 HQvpFMQTM.RGZXoPeiAMZ0I.eZfafx.Bm0Gxf0Hj.zwrFIb7w21OTGjqTlrlLq1Y9k_zmjaNQPyH
 h4u9_obc_uMr8D0Z4dHDiswGpQfDkFImnuzqEz9UbUTOSces6sUcgf6zxpyE5WrW37E6h5B1g8x2
 Op1Hne2qUPHPu4wDI3DfTDIWf6WyQ1QPQZv_rnDaeEmPK73pLXNoZQKcunE2y6Cz3n9MYJ4XvIsq
 SonSizYsUxQjR6fLFVmUqKRUW2TprkrRrVjyAKz_cS34qSsa31xmzqEneowWY3eWwfF2FM7G2yeu
 MZyWssML5gikguzN4iSwogzWLqvPzGiuqKHVZ32Rw.LnpOZJearC_TwhVmc5G0bm7NiAA99UUh9k
 hpkPqeGaD3KPw.NEff3L7Im.BoKvIoL1ruS75zrvZWyccOC6L5vqHRrn_.6EzqwhjKuG54SeoDgi
 KGGtBMV4LS3QsCLyHb7D9jaqOTyTcrA8IpGgR6KW5q5m7lEhNuaLvesDJl0Y91MSGlwT37_84sRG
 Ya4t6b.vXarEz8T9_vePdfDISBgDFpnNg37H8oVNuMFuGjS3M2Mxi_LjFMaH1Q3HRC0CiJjDEazj
 QsMwuwaKPriKKf9zpEVUCHFUZYaLeqIBBLRjMFYpRK9dHHJwqX83tNisnOpVbf82clnKsslFRG7F
 D9H20lvYPkkC1fDQUdHPNko9L1YsKEJrnosceIx1F8G_WQoplKHVMex.EQVg4xAz.6U9h_GyQ8Z6
 HxTGSrGRAPZ54fWN9gDOXkDLNTIdSb86hcNLKoJ.wZA02y5UGujyBnyZLbXOqSIe7GpRodFt4w47
 vCM6FrL8TOan2K9nKnfNhk8NhA8sTCg2n2O3TxfwrPZBUIXD_ZXbTpcdy7JVTpqDkT43NU3cmR_r
 Id68E5n9WmaoLpxa5d2AKohI2nvywEQ8b.5.lPfFjWO2RhANeuPTth60dilOmxYMAK8vbi7iQthY
 LHs_Bi8VM5IOJzx2X6uF_V_WKZRVMgm4VCMT0.miy5Pgglqcl3det2gac_7JUH7uwAj3d0i4VXYv
 6MSui9Cv3wGx6mRrsxZtbpZFrhF4y3bmevYr3f_go8jEjyycbrQ7t2e_dw3Z_1vgv56f_JvBg1Oq
 Of07Pi_pdlmF7V9NcpDC7_mNpCXURxaM43ZvhWtJIEoat8zSVYeAmj.aYWPqxzBwsUPOoVkuOUSg
 bNZe4bqcLf9mLAp7Vo7JyayQ8Pvwq5ngXFtPo7gEgPcdAC2DDbem8cEA4kKFgRwnjaPe5D9.yiqN
 TGTUn.C8YbUpUQ9TynjIy4HzzDGSZzZtN3Uvb00KrJpGZabwIuHPAGtMti3.jy4ieUsMBAeIlwHw
 57pu2SmdiG6bPMNXEu0VyFvusJwhgXTvtdCX0HmPzdlMoKRIzWuqH7yp8VtJrPWrHMyPcFSmRaYA
 UdoUlKBhICsc93RNp8LloinE8OTpiaVrAO2FtJq1dyWLtmC6SE4IZjUOFDZTwsonG3jwwJQIX2rt
 hZ9RYy0IXNmg8eQ060NthB9E31wDxBVZdzGBoaAOv2UG2nBED1tjCEeoPMsgqKM1xSAlndG83srX
 EynhZmyOppKra29ZfuafAdoAQ3wmLqF6.1NSmFUE8x_7vA8cUnStcYbd3MSkjT8TU_FZ19NpoF4U
 Pe6A2UU0PnXi5..CJHab58clXv3nmeBECvlM9lCYCJsMXBOXbfgw3nJJpfLYAPQ--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Fri, 12 Mar 2021 13:25:23 +0000
Received: by smtp407.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 565dc1887bd0bfe556a19355b4c05845; 
 Fri, 12 Mar 2021 13:25:21 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/7] drm: add simpledrm driver
Date: Fri, 12 Mar 2021 08:25:20 -0500
Message-ID: <13151736.3ABD299py7@nerdopolis>
In-Reply-To: <cf7a886b-93de-b8d5-4028-e3aa0cf24b0d@suse.de>
References: <20160902082245.7119-1-dh.herrmann@gmail.com>
 <1761762.3HQLrFs1K7@nerdopolis>
 <cf7a886b-93de-b8d5-4028-e3aa0cf24b0d@suse.de>
MIME-Version: 1.0
X-Mailer: WebService/1.1.17936
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.9.1)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, March 12, 2021 3:03:46 AM EST Thomas Zimmermann wrote:
> Hi
> 
> Am 12.03.21 um 04:49 schrieb nerdopolis:
> > On Wednesday, March 10, 2021 4:10:35 AM EST Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 10.03.21 um 03:50 schrieb nerdopolis:
> >>> On Friday, September 2, 2016 4:22:38 AM EST David Herrmann wrote:
> >>>> Hey
> >>>>
> >>>> On request of Noralf, I picked up the patches and prepared v5. Works fine with
> >>>> Xorg, if configured according to:
> >>>>       https://lists.freedesktop.org/archives/dri-devel/2014-January/052777.html
> >>>> If anyone knows how to make Xorg pick it up dynamically without such a static
> >>>> configuration, please let me know.
> >>>>
> >>>>
> >>>>
> >>> Hi
> >>>
> >>> I am kind of curious as I do have interest in seeing this merged as well.
> >>
> >> Please take a look at [1]. It's not the same driver, but something to
> >> the same effect. I know it's been almost a year, but I do work on this
> >> and intend to come back with a new version during 2021.
> >>
> >> I currently work on fastboot support for the new driver. But it's a
> >> complicated matter and takes time. If there's interest, we could talk
> >> about merging what's already there.
> >>
> >> Best regards
> >> Thomas
> >>
> >> [1]
> >> https://lore.kernel.org/dri-devel/20200625120011.16168-1-tzimmermann@suse.de/
> >>
> >>>
> >>> There is an email in this thread from 2018, but when I tried to import an mbox
> >>> file from the whole month for August 2018, for some reason, kmail doesn't see
> >>> the sender and mailing list recipient in that one, so I will reply to this one,
> >>> because I was able to import this into my mail client.
> >>> https://www.spinics.net/lists/dri-devel/msg185519.html
> >>>
> >>> I was able to get this to build against Linux 4.8, but not against a newer
> >>> version, some headers seem to have been split, and some things are off by 8
> >>> and other things. I could NOT find a git repo, but I was able to find the
> >>> newest patches I could find, and import those with git am against 4.8 with
> >>> some tweaks. If that is needed, I can link it, but only if you want.
> >>>
> >>> However in QEMU I wasn't able to figure out how to make it create a
> >>> /dev/dri/card0 device, even after blacklisting the other modules for qxl,
> >>> cirrus, etc, and then modprobe-ing simpledrm
> >>>
> >>> In my view something like this is would be useful. There still could be
> >>> hardware devices that don't have modesetting support (like vmvga in
> >>> qemu/virt-manager as an example). And most wayland servers need a
> >>> /dev/dri/card0 device as well as a potential user-mode TTY replacement would
> >>> also need /dev/dri/card0
> >>>
> >>> I will admit I unfortunately failed to get it to build against master. I
> >>> couldn't figure out some of the changes, where some new structs were off by
> >>> a factor of 8.
> >>>
> >>>
> >>> Thanks
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> dri-devel mailing list
> >>> dri-devel@lists.freedesktop.org
> >>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>>
> >>
> >>
> > Hi
> > 
> > I tried simplekms against v5.9, and it built, and it runs, and is pretty neat.
> > 
> > I tried using the qxl, cirrus, and vmware card in QEMU. Weston starts on all
> > of them. And I did ensure that the simplekms driver was being used
> 
> Cool! Thanks a lot. When I submit the next patchset can I add
> 
> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
> 
> to the tags?
> 
Sure!
> > 
> > That is, it works after adding GRUB_GFXPAYLOAD_LINUX=keep , to avoid having to
> > set a VGA option. (although not sure the equivalent in syslinux yet)
> 
> Yeah, it's a known 'limitation.' (1) But it's usually something that 
> Linux distributions take care of.
> 
> The rsp kernel feature needs a set up from the firmware/bootloader/etc. 
> Once the driver has been merged, added other generic drivers (EFI, VESA, 
> etc) should be a lot easier. Those would maybe not require the firmware 
> setup.
> 
> Best regards
> Thomas
> 
> (1) Well, it's the way it's supposed to work.
> 
> >   
> > 
> > Thanks.
> > 
> > 
> 
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
